#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\Com\CY.ahk" { CY }
#Import "..\..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import "..\..\Com\StructuredStorage\ILockBytes.ahk" { ILockBytes }
#Import ".\IDebugExtendedProperty.ahk" { IDebugExtendedProperty }
#Import ".\IDebugProperty.ahk" { IDebugProperty }
#Import "..\..\Ole\IRecordInfo.ahk" { IRecordInfo }
#Import "..\..\Variant\VARENUM.ahk" { VARENUM }
#Import "..\..\Variant\VARIANT.ahk" { VARIANT }

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
