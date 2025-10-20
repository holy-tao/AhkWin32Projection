#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides proper maintenance of caches. It maintains the caches by connecting the running object's IDataObject implementation to the cache, allowing the cache to receive notifications from the running object.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-iolecachecontrol
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleCacheControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleCacheControl
     * @type {Guid}
     */
    static IID => Guid("{00000129-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnRun", "OnStop"]

    /**
     * 
     * @param {IDataObject} pDataObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolecachecontrol-onrun
     */
    OnRun(pDataObject) {
        result := ComCall(3, this, "ptr", pDataObject, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolecachecontrol-onstop
     */
    OnStop() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
