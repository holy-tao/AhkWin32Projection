#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UiaChangeInfo.ahk" { UiaChangeInfo }
#Import ".\EventArgsType.ahk" { EventArgsType }

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UiaChangesEventArgs {
    #StructPack 8

    Type : EventArgsType

    EventId : Int32

    EventIdCount : Int32

    pUiaChanges : UiaChangeInfo.Ptr

}
