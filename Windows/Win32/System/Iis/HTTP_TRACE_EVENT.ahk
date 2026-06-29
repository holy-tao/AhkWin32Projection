#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HTTP_TRACE_EVENT_ITEM.ahk" { HTTP_TRACE_EVENT_ITEM }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HTTP_TRACE_EVENT {
    #StructPack 8

    pProviderGuid : Guid.Ptr

    dwArea : UInt32

    pAreaGuid : Guid.Ptr

    dwEvent : UInt32

    pszEventName : PWSTR

    dwEventVersion : UInt32

    dwVerbosity : UInt32

    pActivityGuid : Guid.Ptr

    pRelatedActivityGuid : Guid.Ptr

    dwTimeStamp : UInt32

    dwFlags : UInt32

    cEventItems : UInt32

    pEventItems : HTTP_TRACE_EVENT_ITEM.Ptr

}
