#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EventArgsType.ahk" { EventArgsType }
#Import ".\TextEditChangeType.ahk" { TextEditChangeType }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UiaTextEditTextChangedEventArgs {
    #StructPack 8

    Type : EventArgsType

    EventId : Int32

    TextEditChangeType : TextEditChangeType

    pTextChange : SAFEARRAY.Ptr

}
