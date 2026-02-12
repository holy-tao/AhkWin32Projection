#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DisplayView.ahk
#Include .\DisplayTarget.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\DisplayWireFormat.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\DisplayModeInfo.ahk
#Include ..\..\..\Foundation\Collections\IMap.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Creates an NT handle for controlling access to scanout on this path.
 * @remarks
 * Multiple processes can have handles of the same object, enabling use of the object for interprocess synchronization or sharing. These object-sharing mechanisms are available.
 * 
 * * A process can specify the object handle in a call to the [DuplicateHandle](../handleapi/nf-handleapi-duplicatehandle.md) function to create a duplicate handle that can be used by another process.
 * * A process can specify the name of the object in a call to the [IDisplayDeviceInterop.OpenSharedHandle](nf-windows-devices-display-core-interop-idisplaydeviceinterop-opensharedhandle.md) function.
 * 
 * Use the [CloseHandle](../handleapi/nf-handleapi-closehandle.md) function to close the handle. The system closes the handle automatically when the process terminates. The object is destroyed when its last handle has been closed and its last interface reference has been released.
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.devices.display.core.interop/nf-windows-devices-display-core-interop-idisplaypathinterop-createsourcepresentationhandle
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayPath extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayPath
     * @type {Guid}
     */
    static IID => Guid("{b3dfd64a-7460-5cde-811b-d5ae9f3d9f84}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_View", "get_Target", "get_Status", "get_SourceResolution", "put_SourceResolution", "get_SourcePixelFormat", "put_SourcePixelFormat", "get_IsStereo", "put_IsStereo", "get_TargetResolution", "put_TargetResolution", "get_PresentationRate", "put_PresentationRate", "get_IsInterlaced", "put_IsInterlaced", "get_WireFormat", "put_WireFormat", "get_Rotation", "put_Rotation", "get_Scaling", "put_Scaling", "FindModes", "ApplyPropertiesFromMode", "get_Properties"]

    /**
     * @type {DisplayView} 
     */
    View {
        get => this.get_View()
    }

    /**
     * @type {DisplayTarget} 
     */
    Target {
        get => this.get_Target()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {IReference<SizeInt32>} 
     */
    SourceResolution {
        get => this.get_SourceResolution()
        set => this.put_SourceResolution(value)
    }

    /**
     * @type {Integer} 
     */
    SourcePixelFormat {
        get => this.get_SourcePixelFormat()
        set => this.put_SourcePixelFormat(value)
    }

    /**
     * @type {Boolean} 
     */
    IsStereo {
        get => this.get_IsStereo()
        set => this.put_IsStereo(value)
    }

    /**
     * @type {IReference<SizeInt32>} 
     */
    TargetResolution {
        get => this.get_TargetResolution()
        set => this.put_TargetResolution(value)
    }

    /**
     * @type {IReference<DisplayPresentationRate>} 
     */
    PresentationRate {
        get => this.get_PresentationRate()
        set => this.put_PresentationRate(value)
    }

    /**
     * @type {IReference<Boolean>} 
     */
    IsInterlaced {
        get => this.get_IsInterlaced()
        set => this.put_IsInterlaced(value)
    }

    /**
     * @type {DisplayWireFormat} 
     */
    WireFormat {
        get => this.get_WireFormat()
        set => this.put_WireFormat(value)
    }

    /**
     * @type {Integer} 
     */
    Rotation {
        get => this.get_Rotation()
        set => this.put_Rotation(value)
    }

    /**
     * @type {Integer} 
     */
    Scaling {
        get => this.get_Scaling()
        set => this.put_Scaling(value)
    }

    /**
     * @type {IMap<Guid, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @returns {DisplayView} 
     */
    get_View() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayView(value)
    }

    /**
     * 
     * @returns {DisplayTarget} 
     */
    get_Target() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayTarget(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<SizeInt32>} 
     */
    get_SourceResolution() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetSizeInt32(), value)
    }

    /**
     * 
     * @param {IReference<SizeInt32>} value 
     * @returns {HRESULT} 
     */
    put_SourceResolution(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SourcePixelFormat() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SourcePixelFormat(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStereo() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsStereo(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<SizeInt32>} 
     */
    get_TargetResolution() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetSizeInt32(), value)
    }

    /**
     * 
     * @param {IReference<SizeInt32>} value 
     * @returns {HRESULT} 
     */
    put_TargetResolution(value) {
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<DisplayPresentationRate>} 
     */
    get_PresentationRate() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDisplayPresentationRate(), value)
    }

    /**
     * 
     * @param {IReference<DisplayPresentationRate>} value 
     * @returns {HRESULT} 
     */
    put_PresentationRate(value) {
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_IsInterlaced() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetBoolean(), value)
    }

    /**
     * 
     * @param {IReference<Boolean>} value 
     * @returns {HRESULT} 
     */
    put_IsInterlaced(value) {
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DisplayWireFormat} 
     */
    get_WireFormat() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayWireFormat(value)
    }

    /**
     * 
     * @param {DisplayWireFormat} value 
     * @returns {HRESULT} 
     */
    put_WireFormat(value) {
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Rotation() {
        result := ComCall(23, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Rotation(value) {
        result := ComCall(24, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Scaling() {
        result := ComCall(25, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Scaling(value) {
        result := ComCall(26, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @returns {IVectorView<DisplayModeInfo>} 
     */
    FindModes(flags) {
        result := ComCall(27, this, "uint", flags, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(DisplayModeInfo, result_)
    }

    /**
     * 
     * @param {DisplayModeInfo} modeResult 
     * @returns {HRESULT} 
     */
    ApplyPropertiesFromMode(modeResult) {
        result := ComCall(28, this, "ptr", modeResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IMap<Guid, IInspectable>} 
     */
    get_Properties() {
        result := ComCall(29, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => IPropertyValue(ptr).GetGuid(), IInspectable, value)
    }
}
