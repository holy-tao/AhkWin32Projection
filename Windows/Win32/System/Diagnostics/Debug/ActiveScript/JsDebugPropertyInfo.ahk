#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\JS_PROPERTY_ATTRIBUTES.ahk" { JS_PROPERTY_ATTRIBUTES }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct JsDebugPropertyInfo {
    #StructPack 8

    name : BSTR

    type : BSTR

    value : BSTR

    fullName : BSTR

    attr : JS_PROPERTY_ATTRIBUTES

}
