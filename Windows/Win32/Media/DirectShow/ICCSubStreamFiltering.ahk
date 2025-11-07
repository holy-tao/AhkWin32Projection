#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ICCSubStreamFiltering)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-iccsubstreamfiltering
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class ICCSubStreamFiltering extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICCSubStreamFiltering
     * @type {Guid}
     */
    static IID => Guid("{4b2bd7ea-8347-467b-8dbf-62f784929cc3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SubstreamTypes", "put_SubstreamTypes"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-iccsubstreamfiltering-get_substreamtypes
     */
    get_SubstreamTypes() {
        result := ComCall(3, this, "int*", &pTypes := 0, "HRESULT")
        return pTypes
    }

    /**
     * 
     * @param {Integer} Types 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-iccsubstreamfiltering-put_substreamtypes
     */
    put_SubstreamTypes(Types) {
        result := ComCall(4, this, "int", Types, "HRESULT")
        return result
    }
}
