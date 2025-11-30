#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values of the IASCOMPONENTPROPERTIES enumeration type enumerate identifiers for an SDO object.
 * @remarks
 * 
 * The following code snippet demonstrates obtaining the component ID of an SDO object. The variable pSdo points to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nn-sdoias-isdo">ISdo</a> interface.
 * 
 * 
 * ```cpp
 * HRESULT    hr;
 * _variant_t    vtProperty;
 * hr = pSdo->GetProperty(PROPERTY_COMPONENT_ID, &vtProperty);
 * 
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/ne-sdoias-iascomponentproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class IASCOMPONENTPROPERTIES extends Win32Enum{

    /**
     * The component ID for the SDO object.
     * @type {Integer (Int32)}
     */
    static PROPERTY_COMPONENT_ID => 1024

    /**
     * The program ID for the SDO object.
     * @type {Integer (Int32)}
     */
    static PROPERTY_COMPONENT_PROG_ID => 1025

    /**
     * The start value for RADIUS Protocol properties, defined for convenience.
     * @type {Integer (Int32)}
     */
    static PROPERTY_COMPONENT_START => 1026
}
