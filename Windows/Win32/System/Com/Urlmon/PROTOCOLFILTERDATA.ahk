#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IInternetProtocolSink.ahk" { IInternetProtocolSink }
#Import ".\IInternetProtocol.ahk" { IInternetProtocol }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct PROTOCOLFILTERDATA {
    #StructPack 8

    cbSize : UInt32 := this.Size

    pProtocolSink : IInternetProtocolSink

    pProtocol : IInternetProtocol

    pUnk : IUnknown

    dwFilterFlags : UInt32

}
