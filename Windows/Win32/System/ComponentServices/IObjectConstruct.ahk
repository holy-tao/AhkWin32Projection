#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Controls the object construction process by passing in parameters from other methods or objects.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iobjectconstruct
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IObjectConstruct extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectConstruct
     * @type {Guid}
     */
    static IID => Guid("{41c4f8b3-7439-11d2-98cb-00c04f8ee1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Construct"]

    /**
     * Constructs an object using the specified parameters.
     * @param {IDispatch} pCtorObj A reference to an implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjectconstructstring">IObjectConstructString</a> interface.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iobjectconstruct-construct
     */
    Construct(pCtorObj) {
        result := ComCall(3, this, "ptr", pCtorObj, "HRESULT")
        return result
    }
}
