#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that handles the data passed by the [MediaProtectionManager](mediaprotectionmanager.md) when the resume operation is completed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.servicerequestedeventhandler
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class ServiceRequestedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ServiceRequestedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{d2d690ba-cac9-48e1-95c0-d38495a84055}")

    /**
     * The class identifier for ServiceRequestedEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{d2d690ba-cac9-48e1-95c0-d38495a84055}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {MediaProtectionManager} sender 
     * @param {ServiceRequestedEventArgs} e 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender, e) {
        result := ComCall(3, this, "ptr", sender, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
