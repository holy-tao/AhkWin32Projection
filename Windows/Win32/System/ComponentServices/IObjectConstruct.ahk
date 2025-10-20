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
     * 
     * @param {Pointer<IDispatch>} pCtorObj 
     * @returns {HRESULT} 
     */
    Construct(pCtorObj) {
        result := ComCall(3, this, "ptr", pCtorObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
