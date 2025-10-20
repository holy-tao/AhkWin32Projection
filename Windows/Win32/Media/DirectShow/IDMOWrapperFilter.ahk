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
     * 
     * @param {Pointer<Guid>} clsidDMO 
     * @param {Pointer<Guid>} catDMO 
     * @returns {HRESULT} 
     */
    Init(clsidDMO, catDMO) {
        result := ComCall(3, this, "ptr", clsidDMO, "ptr", catDMO, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
