#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IDebugExtendedProperty.ahk" { IDebugExtendedProperty }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Com\CY.ahk" { CY }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\IDebugProperty.ahk" { IDebugProperty }
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Variant\VARENUM.ahk" { VARENUM }
#Import "..\..\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\Ole\IRecordInfo.ahk" { IRecordInfo }
#Import "..\..\Com\StructuredStorage\ILockBytes.ahk" { ILockBytes }
#Import "..\..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\..\Com\IDispatch.ahk" { IDispatch }
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
