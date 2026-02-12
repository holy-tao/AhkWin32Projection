#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\DisplayPath.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\Collections\IMap.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayView extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayView
     * @type {Guid}
     */
    static IID => Guid("{b0c98ca1-b759-5b59-b1ad-f0786aa9e53d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Paths", "get_ContentResolution", "put_ContentResolution", "SetPrimaryPath", "get_Properties"]

    /**
     * @type {IVectorView<DisplayPath>} 
     */
    Paths {
        get => this.get_Paths()
    }

    /**
     * @type {IReference<SizeInt32>} 
     */
    ContentResolution {
        get => this.get_ContentResolution()
        set => this.put_ContentResolution(value)
    }

    /**
     * @type {IMap<Guid, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @returns {IVectorView<DisplayPath>} 
     */
    get_Paths() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(DisplayPath, value)
    }

    /**
     * 
     * @returns {IReference<SizeInt32>} 
     */
    get_ContentResolution() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
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
    put_ContentResolution(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DisplayPath} path_ 
     * @returns {HRESULT} 
     */
    SetPrimaryPath(path_) {
        result := ComCall(9, this, "ptr", path_, "int")
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
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => IPropertyValue(ptr).GetGuid(), IInspectable, value)
    }
}
