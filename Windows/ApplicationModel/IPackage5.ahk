#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Foundation\Collections\IVector.ahk
#Include .\PackageContentGroup.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IPackage5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackage5
     * @type {Guid}
     */
    static IID => Guid("{0e842dd4-d9ac-45ed-9a1e-74ce056b2635}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetContentGroupsAsync", "GetContentGroupAsync", "StageContentGroupsAsync", "StageContentGroupsWithPriorityAsync", "SetInUseAsync"]

    /**
     * 
     * @returns {IAsyncOperation<IVector<PackageContentGroup>>} 
     */
    GetContentGroupsAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVector.Call.Bind(IVector, PackageContentGroup), operation)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {IAsyncOperation<PackageContentGroup>} 
     */
    GetContentGroupAsync(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(7, this, "ptr", name, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PackageContentGroup, operation)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} names 
     * @returns {IAsyncOperation<IVector<PackageContentGroup>>} 
     */
    StageContentGroupsAsync(names) {
        result := ComCall(8, this, "ptr", names, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVector.Call.Bind(IVector, PackageContentGroup), operation)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} names 
     * @param {Boolean} moveToHeadOfQueue 
     * @returns {IAsyncOperation<IVector<PackageContentGroup>>} 
     */
    StageContentGroupsWithPriorityAsync(names, moveToHeadOfQueue) {
        result := ComCall(9, this, "ptr", names, "int", moveToHeadOfQueue, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVector.Call.Bind(IVector, PackageContentGroup), operation)
    }

    /**
     * 
     * @param {Boolean} inUse 
     * @returns {IAsyncOperation<Boolean>} 
     */
    SetInUseAsync(inUse) {
        result := ComCall(10, this, "int", inUse, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
