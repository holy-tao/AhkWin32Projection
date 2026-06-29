#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\SUBSCRIPTIONSCHEDULE.ahk" { SUBSCRIPTIONSCHEDULE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SUBSCRIPTIONTYPE.ahk" { SUBSCRIPTIONTYPE }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct SUBSCRIPTIONINFO {
    #StructPack 8

    cbSize : UInt32 := this.Size

    fUpdateFlags : UInt32

    schedule : SUBSCRIPTIONSCHEDULE

    customGroupCookie : Guid

    pTrigger : IntPtr

    dwRecurseLevels : UInt32

    fWebcrawlerFlags : UInt32

    bMailNotification : BOOL

    bGleam : BOOL

    bChangesOnly : BOOL

    bNeedPassword : BOOL

    fChannelFlags : UInt32

    bstrUserName : BSTR

    bstrPassword : BSTR

    bstrFriendlyName : BSTR

    dwMaxSizeKB : UInt32

    subType : SUBSCRIPTIONTYPE

    fTaskFlags : UInt32

    dwReserved : UInt32

}
