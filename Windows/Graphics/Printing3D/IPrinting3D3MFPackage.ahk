#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Storage\Streams\IRandomAccessStream.ahk
#Include .\Printing3DTextureResource.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\Printing3DModel.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrinting3D3MFPackage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3D3MFPackage
     * @type {Guid}
     */
    static IID => Guid("{f64dd5c8-2ab7-45a9-a1b7-267e948d5b18}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SaveAsync", "get_PrintTicket", "put_PrintTicket", "get_ModelPart", "put_ModelPart", "get_Thumbnail", "put_Thumbnail", "get_Textures", "LoadModelFromPackageAsync", "SaveModelToPackageAsync"]

    /**
     * @type {IRandomAccessStream} 
     */
    PrintTicket {
        get => this.get_PrintTicket()
        set => this.put_PrintTicket(value)
    }

    /**
     * @type {IRandomAccessStream} 
     */
    ModelPart {
        get => this.get_ModelPart()
        set => this.put_ModelPart(value)
    }

    /**
     * @type {Printing3DTextureResource} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
        set => this.put_Thumbnail(value)
    }

    /**
     * @type {IVector<Printing3DTextureResource>} 
     */
    Textures {
        get => this.get_Textures()
    }

    /**
     * 
     * @returns {IAsyncOperation<IRandomAccessStream>} 
     */
    SaveAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IRandomAccessStream, operation)
    }

    /**
     * 
     * @returns {IRandomAccessStream} 
     */
    get_PrintTicket() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStream(value)
    }

    /**
     * 
     * @param {IRandomAccessStream} value 
     * @returns {HRESULT} 
     */
    put_PrintTicket(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IRandomAccessStream} 
     */
    get_ModelPart() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStream(value)
    }

    /**
     * 
     * @param {IRandomAccessStream} value 
     * @returns {HRESULT} 
     */
    put_ModelPart(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Printing3DTextureResource} 
     */
    get_Thumbnail() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Printing3DTextureResource(value)
    }

    /**
     * 
     * @param {Printing3DTextureResource} value 
     * @returns {HRESULT} 
     */
    put_Thumbnail(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<Printing3DTextureResource>} 
     */
    get_Textures() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Printing3DTextureResource, value)
    }

    /**
     * 
     * @param {IRandomAccessStream} value 
     * @returns {IAsyncOperation<Printing3DModel>} 
     */
    LoadModelFromPackageAsync(value) {
        result := ComCall(14, this, "ptr", value, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Printing3DModel, operation)
    }

    /**
     * 
     * @param {Printing3DModel} value 
     * @returns {IAsyncAction} 
     */
    SaveModelToPackageAsync(value) {
        result := ComCall(15, this, "ptr", value, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
