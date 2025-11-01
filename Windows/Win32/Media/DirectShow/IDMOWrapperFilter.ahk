#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDMOWrapperFilter interface enables an application to use a DirectX Media Object (DMO) inside a filter graph.
 * @see https://docs.microsoft.com/windows/win32/api//dmodshow/nn-dmodshow-idmowrapperfilter
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDMOWrapperFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDMOWrapperFilter
     * @type {Guid}
     */
    static IID => Guid("{52d6f586-9f0f-4824-8fc8-e32ca04930c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init"]

    /**
     * 
     * @param {Pointer<Guid>} clsidDMO 
     * @param {Pointer<Guid>} catDMO 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dmodshow/nf-dmodshow-idmowrapperfilter-init
     */
    Init(clsidDMO, catDMO) {
        result := ComCall(3, this, "ptr", clsidDMO, "ptr", catDMO, "HRESULT")
        return result
    }
}
