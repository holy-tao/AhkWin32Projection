#Requires AutoHotkey v2.1-alpha.30

#Import "../Windows/Win32/Networking/WinHttp/IWinHttpRequestEvents.ahk" { IWinHttpRequestEvents }
#Import "../Windows/Win32/System/Com/IConnectionPointContainer.ahk" { IConnectionPointContainer }
#Import "../Windows/Win32/Foundation/BSTR.ahk" { BSTR }

/*
Demonstrates the process of creating and using a COM intrerface, as well as the process of
implementing an interface of your own
*/

done := false

; Create the WinHttpRequest object -- it's easier to start with AHK's native COM interop
whr := ComObject("WinHttp.WinHttpRequest.5.1")

; Create an event handler
eventSink := WinHttpRequestEventSink()
eventSink.doneCallback := (*) => OnDone(whr)
eventSinkInterface := IWinHttpRequestEvents(eventSink)

;Register with the http request - since whr is a native ComObjct, we can use ComObjQuery here
containerPtr := ComObjQuery(whr, String(IConnectionPointContainer.IID))
container := IConnectionPointContainer(containerPtr.ptr)

connectionPoint := container.FindConnectionPoint(IWinHttpRequestEvents.IID)
connectionPoint.Advise(eventSinkInterface.ptr)

; Send the request
whr.Open("GET", "https://www.autohotkey.com", true)
whr.Send()

MsgBox("Look ma, asynchronous execution!")

while(!done){
    Sleep(100)
}

; Don't forget to clean up! Note that we must be careful about the order in which resources are
; disposed of. If the WinHttpRequest were disposed of before the IWinHttpRequestEvents, it would
; try to call Release() on an AHK object that no longer exists, and our script would crash.

; It's also generally not safe to do this in callbacks; e.g. if we disposed of the event sink in
; OnDone, we'd be freeing its callbacks *while inside a callback*, causing unpredictable but
; generally undesireable behavior.
connectionPoint := unset
container := unset
whr := unset
eventSinkInterface.Dispose()

OnDone(request){
    MsgBox(request.responseText)

    global done := true
}

;https://learn.microsoft.com/en-us/windows/win32/winhttp/iwinhttprequestevents-interface
class WinHttpRequestEventSink {
    doneCallback := (*) => MsgBox("done!")

    ;https://learn.microsoft.com/en-us/windows/win32/winhttp/iwinhttprequestevents-onerror
    OnError(_vtbl, errorNumber, errorDescription){
        desc := BSTR(errorDescription)
        throw Error(Format("(0x{1:0X}) {2}", errorNumber, String(desc)))
    }

    ;https://learn.microsoft.com/en-us/windows/win32/winhttp/iwinhttprequestevents-onresponsedataavailable
    OnResponseDataAvailable(_vtbl, data){
        ; Streaming is hard
    }

    ;https://learn.microsoft.com/en-us/windows/win32/winhttp/iwinhttprequestevents-onresponsestart
    OnResponseStart(_vtbl, status, contentType){
        try FileAppend(Format("{1} {2}`n", status, BSTR(contentType).ToString()), "*")
    }

    ;https://learn.microsoft.com/en-us/windows/win32/winhttp/iwinhttprequestevents-onresponsefinished
    OnResponseFinished(_vtbl){
        this.doneCallback.Call()
    }
}