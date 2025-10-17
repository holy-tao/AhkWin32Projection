#Requires AutoHotkey v2.0
#Include ../../Windows/Win32/Networking/WinSock/Apis.ahk
#Include ../../Windows/Win32/Networking/WinSock/ADDRINFOW.ahk
#Include ../../Windows/Win32/Networking/WinSock/ADDRESS_FAMILY.ahk
#Include ../../Windows/Win32/Networking/WinSock/WINSOCK_SOCKET_TYPE.ahk
#Include ../../Windows/Win32/Networking/WinSock/SOCKET_SECURITY_PROTOCOL.ahk
#Include ../../Windows/Win32/Networking/WinSock/IPPROTO.ahk
#Include ../../Windows/Win32/Networking/WinSock/WSADATA.ahk
#Include ../../Windows/Win32/Networking/WinSock/SOCKADDR.ahk
#Include ../../Windows/Win32/Networking/WinSock/WINSOCK_SHUTDOWN_HOW.ahk
#Include ../../Windows/Win32/Networking/WinSock/WSA_ERROR.ahk
#Include ../../Windows/Win32/Networking/WinSock/TIMEVAL.ahk
#Include ../../Windows/Win32/Networking/WinSock/FD_SET.ahk

#Include HttpResponse.ahk
#Include HttpRequest.ahk

#DllLoad WS2_32.dll

/**
 * A simple example singlethreaded HTTP server that serves text files (including its
 * own source code!)
 * https://learn.microsoft.com/en-us/windows/win32/winsock/winsock-server-application
 * 
 * Is AutoHotkey the right tool for this job?
 *                                                                  ...no
 */
class TextFileServer {

    /**
     * Map of file extentions to MIME types - add to the list for more support
     * @type {Map<string, string>}
     */
    static MIMETypes := Map(
        "txt", "text/plain",
        "json", "text/json",
        "ahk", "text/plain",
        "html", "text/html"
    )

    /**
     * @type {SOCKET}
     */
    socket := unset

    port := unset

    /**
     * Set to false to cause ListenForever() to halt after the next connection finishes
     * @type {Boolean}
     */
    run := false

    /**
     * Initialize the server
     */
    __New(port := 27015){
        ; Start up WSA
        winSockData := WSADATA()
        if(errNo := WinSock.WSAStartup(0x0202, winSockData)){
            throw OSError(errNo, , "WinSock.WSAStartup()")
        }

        ; Create a Socket for the server
        this.socket := this._CreateSocketAndBind(port)
    }

    /**
     * Handles an incoming connection
     * @param {Integer} client the client socket descriptor 
     */
    HandleConnection(client){
        try{
            request := this.ReceiveRequest(client)

            request.uri := LTrim(request.uri, "/\")

            if(FileExist(request.uri)){
                SplitPath(request.uri, &name, &dir, &ext)
                response := HttpResponse.OK(FileRead(request.uri), TextFileServer.MIMETypes.Get(ext, "text/plain"))
            }
            else{
                response := HttpResponse.NotFound("404 Not Found:`n" . A_WorkingDir . "\" . request.uri)
            }

            this.SendResponse(client, response)
        }
        catch Error as err{
            if(!(err is OSError && err.number == WSA_ERROR.WSAEWOULDBLOCK)){
                FileAppend(Format("{1}: {2}`n`t(Specifically: {3})`n", Type(Err), err.Message, err.Extra), "*")
                FileAppend(err.Stack . "`n", "*")

                errResponse := HttpResponse.ServerError(err)
                this.SendResponse(client, errResponse)
            }
        }
        finally{
            WinSock.shutdown(client, WINSOCK_SHUTDOWN_HOW.SD_BOTH)
            client.Free()
        }
    }

    /**
     * Receive an incoming request
     * @param {Integer} client socket descriptor to read from
     * @param {Integer} chunkSize number of bytes to read per chunk (default: 512)
     * @returns {HttpRequest} the received request
     */
    ReceiveRequest(client, chunkSize := 512){
        recvBuf := Buffer(chunkSize, 0), bytesRcvd := 0
        requestBuf := ""
        pos := 0,
        request := HttpRequest()

        ; Read headers until we get to to the body
        while((bytesRcvd := WinSock.recv(client, recvBuf, recvBuf.Size, 0)) > 0){
            requestBuf .= StrGet(recvBuf, bytesRcvd, "UTF-8")
            if(pos := InStr(requestBuf, "`r`n`r`n")) {
                break   ; Found the end of the headers
            }
        }

        ; Split headers and any parts of the body we may have read in
        headersPart := SubStr(requestBuf, 1, pos - 1)
        request.body := SubStr(requestBuf, pos + 4)

        ; Parse headers
        loop parse headersPart, "`r`n" {
            if(A_Index == 1){
                firstLine := StrSplit(A_LoopField, A_Space)
                request.method := firstLine[1]
                request.uri := firstLine[2]
                request.httpVersion := firstLine[3]
                continue
            }

            if(!InStr(A_LoopField, ":")){
                continue
            }

            parts := StrSplit(A_LoopField, ":", , 2)
            request.headers[Trim(parts[1])] := Trim(parts[2])
        }

        ; Handle content-length body
        contentLen := request.headers.Has("content-length") ? Integer(request.headers["content-length"]) : 0
        while (StrLen(request.body) < contentLen) {
            bytesRcvd := WinSock.recv(client, recvBuf, recvBuf.Size, 0)
            if (bytesRcvd <= 0)
                break

            request.body .= StrGet(recvBuf, bytesRcvd, "UTF-8")
        }

        return request
    }

    /**
     * Send a response to a client
     * @param {Integer} client socket descriptor to read from
     * @param {HttpResponse} response the response to send 
     * @param {Integer} chunkSize number of bytes to read per chunk (default: 512)
     */
    SendResponse(client, response, chunkSize := 512){
        responseBuffer := response.Tobuffer()
        responsePtr := 0
        
        while(responsePtr < responseBuffer.size){
            len := Min(chunkSize, responseBuffer.Size - responsePtr)
            bytesSent := WinSock.send(client.value, responseBuffer.ptr + responsePtr, len, 0)

            if(bytesSent == WinSock.SOCKET_ERROR){
                throw OSError(WinSock.WSAGetLastError(), , "WinSock.send()")
            }

            responsePtr += bytesSent
        }
    }

    /**
     * Start serving 💃
     */
    Serve(){
        this.run := true

        timeout := TIMEVAL()
        timeout.tv_sec := 1

        ; https://learn.microsoft.com/en-us/windows/win32/winsock/listening-on-a-socket
        while(this.run){
            ; Listen for a connection
            if(WinSock.listen(this.socket, WinSock.SOMAXCONN) == WinSock.SOCKET_ERROR){
                throw OSError(WinSock.WSAGetLastError(), , "WinSock.listen()")
            }

            try{
                clientAddr := SOCKADDR()
                client := WinSock.accept(this.socket, clientAddr, &tmp := SOCKADDR.sizeof)

                if(!client.valid){
                    throw OSError(WinSock.WSAGetLastError(), , "WinSock.accept()")
                }
            }
            catch OSError as err{
                ; (10035) A non-blocking socket operation could not be completed immediately.
                ; Expected if there isn't any work to do - not fatal, we can just wait a bit and ignore it
                if(err.number == WSA_ERROR.WSAEWOULDBLOCK){
                    Sleep(250)
                    continue
                }

                throw
            }

            this.HandleConnection(client)
        }
    }

    /**
     * Friendly shutdown method - tells the server to stop serving after completing its
     * current work. You could also force kill the script. But think of the clients!
     */
    Shutdown(){
        this.run := false
    }

    /**
     * @private Initialize a socket for the server and binds to it
     * @param {String|Integer} port The port to listen on. If not a string, it's converted to a string
     * @returns {SOCKET} The socket descriptor for the new socket (a pointer-sized integer)
     */
    _CreateSocketAndBind(port){
        ; https://learn.microsoft.com/en-us/windows/win32/winsock/creating-a-socket-for-the-server
        ; https://learn.microsoft.com/en-us/windows/win32/winsock/binding-a-socket

        ; Define the properties of the socket that we want
        hints := ADDRINFOW()
        hints.ai_family     := ADDRESS_FAMILY.AF_UNSPEC               ;IpV4
        hints.ai_socktype   := WINSOCK_SOCKET_TYPE.SOCK_STREAM        ;Stream socket
        hints.ai_protocol   := IPPROTO.IPPROTO_TCP                    ;TCP
        hints.ai_flags      := WinSock.AI_PASSIVE ;| WinSock.AI_FILESERVER

        ;GetAddrInfoW returns a pointer to the head of a linked list
        pAddrInfoPtr := Buffer(8)   

        rc := WinSock.GetAddrInfoW(0, String(port), hints.ptr, pAddrInfoPtr)
        if(rc != 0){
            throw OSError(WinSock.WSAGetLastError(), , "WinSock.GetAddrInfoW()")
        }

        addrInfo := ADDRINFOW(NumGet(pAddrInfoPtr, "ptr"))     
        socket := WinSock.INVALID_SOCKET

        try{
            ; Create socket
            socket := WinSock.socket(addrinfo.ai_family, addrinfo.ai_socktype, addrinfo.ai_protocol)
            if(socket == WinSock.INVALID_SOCKET){
                throw OSError(WinSock.WSAGetLastError(), , "WinSock.socket()")
            }

            ; Bind to socket
            rc := WinSock.bind(socket, addrInfo.ai_addr, addrInfo.ai_addrlen)
            if(rc == WinSock.SOCKET_ERROR){
                throw OSError(WinSock.WSAGetLastError(), , "WinSock.bind()")
            }

            ; Make the socket non-blocking
            rc := WinSock.ioctlsocket(socket, WinSock.FIONBIO, &ulong_true := 1)
            if(rc == WinSock.SOCKET_ERROR){
                throw OSError(WinSock.WSAGetLastError(), , "WinSock.ioctlsocket()")
            }
        }
        finally{
            WinSock.FreeAddrInfoW(addrInfo)         ;Free the list WinSock gave us
        }

        this.port := port
        return socket
    }

    /**
     * Cleanup the server when the object is disposed of
     */
    __Delete(){
        ; Calling Free() sets the value to an invalid value, which 
        ; prevents __Delete from double-freeing the resource
        this.socket.Free()  

        ; Shut down WSA
        rc := WinSock.WSACleanup()
        if(rc != 0){
            OSError(WinSock.WSAGetLastError(), , "WinSock.WSACleanup()")
        }
    }
}


server := TextFileServer(port := 8080)

; Add a tray menu option to shut the server down
; Killing the AHK script normally via exit or restart may not properly stop the WinSock
; background process - server's __Delete() needs to fire for this.
A_TrayMenu.Add("Shutdown Server", (*) => server.Shutdown())

SetTimer((*) => Run(Format("http://localhost:{1}/ascii-art/teapot.txt", port)), -1000)
server.Serve()
