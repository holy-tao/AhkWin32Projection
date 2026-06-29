#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\CY.ahk" { CY }
#Import "..\Variant\VARENUM.ahk" { VARENUM }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import ".\MMC_PROPERTY_ACTION.ahk" { MMC_PROPERTY_ACTION }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Ole\IRecordInfo.ahk" { IRecordInfo }

/**
 * The MMC_SNAPIN_PROPERTY structure is introduced in MMC 2.0.
 * @see https://learn.microsoft.com/windows/win32/api/mmcobj/ns-mmcobj-mmc_snapin_property
 * @namespace Windows.Win32.System.Mmc
 */
export default struct MMC_SNAPIN_PROPERTY {
    #StructPack 8

    /**
     * Name of the property.
     */
    pszPropName : PWSTR

    /**
     * The property's value; if the property is being changed, this is the new value.
     */
    varValue : VARIANT

    /**
     * The action taking place on the property, as defined in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmcobj/ne-mmcobj-mmc_property_action">MMC_PROPERTY_ACTION</a>.
     */
    eAction : MMC_PROPERTY_ACTION

}
