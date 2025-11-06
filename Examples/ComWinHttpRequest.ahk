#Requires AutoHotkey v2.0

#Include ../Windows/Win32/Networking/WinHttp/IWinHttpRequest.ahk
#Include ../Windows/Win32/Networking/WinHttp/IWinHttpRequestEvents.ahk
#Include ../Windows/Win32/System/Variant/VARIANT.ahk
#Include ../Windows/Win32/System/Variant/VARENUM.ahk
#Include ../Windows/Win32/System/Com/CLSCTX.ahk
#Include ../Windows/Win32/System/Com/IConnectionPointContainer.ahk
#Include ../Windows/Win32/System/Com/IConnectionPoint.ahk
#Include ../Windows/Win32/System/Com/SAFEARRAY.ahk
#Include ../Windows/Win32/System/Com/Apis.ahk
#Include ../Windows/Win32/System/Ole/Apis.ahk

/*
Demonstrates the process of creating and using a COM intrerface, as well as the process of
implementing an interface of your own
*/

done := false

; Create the WinHttpRequest object
whr := ComObject("WinHttp.WinHttpRequest.5.1")

; Create an event handler
eventSink := WinHttpRequestEventSink()
eventSink.doneCallback := (*) => OnDone(whr)
eventSinkInterface := IWinHttpRequestEvents(eventSink)

;Register with the http request - since whr is a native ComObjct, we can use ComObjQuery here
containerPtr := ComObjQuery(whr, String(IConnectionPointContainer.IID))
container := IConnectionPointContainer(containerPtr.ptr)

connectionPoint := container.FindConnectionPoint(IWinHttpRequestEvents.IID)
pdwCookie := connectionPoint.Advise(eventSinkInterface.ptr)

; Send the request
whr.Open("GET", "https://www.autohotkey.com", true)
whr.Send()

MsgBox("Look ma, asynchronous execution!")

while(!done){
    Sleep(100)
}

OnDone(request){
    MsgBox(request.responseText)

    global done := true
}

;https://learn.microsoft.com/en-us/windows/win32/winhttp/iwinhttprequestevents-interface
class WinHttpRequestEventSink{
    doneCallback := (*) => MsgBox("done!")

    ;https://learn.microsoft.com/en-us/windows/win32/winhttp/iwinhttprequestevents-onerror
    OnError(vTbl, errorNumber, errorDescription){
        desc := BSTR({Value: errorDescription})
        throw Error(Format("(0x{1:0X}) {2}", errorNumber, String(desc)))
    }

    ;https://learn.microsoft.com/en-us/windows/win32/winhttp/iwinhttprequestevents-onresponsedataavailable
    OnResponseDataAvailable(vTbl, data){
        ; Streaming is hard
    }

    ;https://learn.microsoft.com/en-us/windows/win32/winhttp/iwinhttprequestevents-onresponsestart
    OnResponseStart(vTbl, status, contentType){
        ; status is legacy and doesn't actually reflect the HTTP status - though once this event fires
        ; we can grab it from the WinHttpRequest object itself
        contentType := BSTR({Value: contentType})
        try FileAppend(Format("Content type: {1}`n", String(contentType)), "*")
    }

    ;https://learn.microsoft.com/en-us/windows/win32/winhttp/iwinhttprequestevents-onresponsefinished
    OnResponseFinished(vTbl){
        this.doneCallback.Call()
    }
}