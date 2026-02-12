#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CreateSharedPackageContainerResult.ahk
#Include .\DeleteSharedPackageContainerResult.ahk
#Include .\SharedPackageContainer.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class ISharedPackageContainerManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISharedPackageContainerManager
     * @type {Guid}
     */
    static IID => Guid("{be353068-1ef7-5ac8-ab3f-0b9f612f0274}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateContainer", "DeleteContainer", "GetContainer", "FindContainers", "FindContainersWithOptions"]

    /**
     * 
     * @param {HSTRING} name 
     * @param {CreateSharedPackageContainerOptions} options 
     * @returns {CreateSharedPackageContainerResult} 
     */
    CreateContainer(name, options) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(6, this, "ptr", name, "ptr", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CreateSharedPackageContainerResult(result_)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @param {DeleteSharedPackageContainerOptions} options 
     * @returns {DeleteSharedPackageContainerResult} 
     */
    DeleteContainer(id, options) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(7, this, "ptr", id, "ptr", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeleteSharedPackageContainerResult(result_)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {SharedPackageContainer} 
     */
    GetContainer(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(8, this, "ptr", id, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SharedPackageContainer(result_)
    }

    /**
     * 
     * @returns {IVector<SharedPackageContainer>} 
     */
    FindContainers() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(SharedPackageContainer, result_)
    }

    /**
     * 
     * @param {FindSharedPackageContainerOptions} options 
     * @returns {IVector<SharedPackageContainer>} 
     */
    FindContainersWithOptions(options) {
        result := ComCall(10, this, "ptr", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(SharedPackageContainer, result_)
    }
}
