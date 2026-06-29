#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Com\StructuredStorage\ILockBytes.ahk" { ILockBytes }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Com\IDispatch.ahk" { IDispatch }
#Import ".\IDebugExtendedProperty.ahk" { IDebugExtendedProperty }
#Import "..\..\Ole\IRecordInfo.ahk" { IRecordInfo }
#Import "..\..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\..\Variant\VARENUM.ahk" { VARENUM }
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }
#Import ".\IDebugProperty.ahk" { IDebugProperty }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Com\CY.ahk" { CY }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct ExtendedDebugPropertyInfo {
    #StructPack 8

    dwValidFields : UInt32

    pszName : PWSTR

    pszType : PWSTR

    pszValue : PWSTR

    pszFullName : PWSTR

    dwAttrib : UInt32

    pDebugProp : IDebugProperty

    nDISPID : UInt32

    nType : UInt32

    varValue : VARIANT

    plbValue : ILockBytes

    pDebugExtProp : IDebugExtendedProperty

}
