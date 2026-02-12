#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DigitalWindowBounds.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\DigitalWindowCapability.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IDigitalWindowControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDigitalWindowControl
     * @type {Guid}
     */
    static IID => Guid("{23b69eff-65d2-53ea-8780-de582b48b544}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSupported", "get_SupportedModes", "get_CurrentMode", "GetBounds", "Configure", "ConfigureWithBounds", "get_SupportedCapabilities", "GetCapabilityForSize"]

    /**
     * @type {Boolean} 
     */
    IsSupported {
        get => this.get_IsSupported()
    }

    /**
     */
    SupportedModes {
        get => this.get_SupportedModes()
    }

    /**
     * @type {Integer} 
     */
    CurrentMode {
        get => this.get_CurrentMode()
    }

    /**
     * @type {IVectorView<DigitalWindowCapability>} 
     */
    SupportedCapabilities {
        get => this.get_SupportedCapabilities()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSupported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_SupportedModes(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentMode() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * The GetBoundsRect function obtains the current accumulated bounding rectangle for a specified device context.
     * @remarks
     * The DCB_SET value is a combination of the bit values DCB_ACCUMULATE and DCB_RESET. Applications that check the DCB_RESET bit to determine whether the bounding rectangle is empty must also check the DCB_ACCUMULATE bit. The bounding rectangle is empty only if the DCB_RESET bit is 1 and the DCB_ACCUMULATE bit is 0.
     * @returns {DigitalWindowBounds} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-getboundsrect
     */
    GetBounds() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DigitalWindowBounds(result_)
    }

    /**
     * Configures the expert within the expert DLL.
     * @remarks
     * Network Monitor calls the **Configure** function with the current configuration of the expert, if one exists. The expert displays a dialog box, with which you can change any configurable item.
     * 
     * When *ppConfig* is passed in and Network Monitor does not have a configuration stored for the specified expert, the parameter value can be **NULL**. In this case, the **Configure** function assumes hard-coded default values (or, uses the startup information) to open the dialog box.
     * 
     * The configuration data can also be **NULL** when the **Configure** function returns, and a **NULL** was passed-in. This situation occurs when Network Monitor does not have a stored default, and the user presses **Cancel**.
     * 
     * The beginning of the [**EXPERTCONFIG**](expertconfig.md) data structure includes a Private section that stores the structure size information. The size of the **EXPERTCONFIG** structure should include the reserved **DWORD** length that appears at the beginning of the structure. For example, if your configuration data requires 20 bytes of storage space, allocate 24 bytes to store the data. If a *ppConfig* is **NULL**, the **Configure** function calls the [**ExpertAllocMemory**](expertallocmemory.md) function to allocate a new configuration that is the correct size. If the buffer is not enough to hold the expert data, the expert should call the [**ExpertReallocMemory**](expertreallocmemory.md) function.
     * @param {Integer} digitalWindowMode_ 
     * @returns {HRESULT} If the function is successful (that is, if a current configuration exists), the return value is **TRUE**.
     * 
     * If the function is unsuccessful, the return value is **FALSE**.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/configure
     */
    Configure(digitalWindowMode_) {
        result := ComCall(10, this, "int", digitalWindowMode_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Configures the expert within the expert DLL.
     * @remarks
     * Network Monitor calls the **Configure** function with the current configuration of the expert, if one exists. The expert displays a dialog box, with which you can change any configurable item.
     * 
     * When *ppConfig* is passed in and Network Monitor does not have a configuration stored for the specified expert, the parameter value can be **NULL**. In this case, the **Configure** function assumes hard-coded default values (or, uses the startup information) to open the dialog box.
     * 
     * The configuration data can also be **NULL** when the **Configure** function returns, and a **NULL** was passed-in. This situation occurs when Network Monitor does not have a stored default, and the user presses **Cancel**.
     * 
     * The beginning of the [**EXPERTCONFIG**](expertconfig.md) data structure includes a Private section that stores the structure size information. The size of the **EXPERTCONFIG** structure should include the reserved **DWORD** length that appears at the beginning of the structure. For example, if your configuration data requires 20 bytes of storage space, allocate 24 bytes to store the data. If a *ppConfig* is **NULL**, the **Configure** function calls the [**ExpertAllocMemory**](expertallocmemory.md) function to allocate a new configuration that is the correct size. If the buffer is not enough to hold the expert data, the expert should call the [**ExpertReallocMemory**](expertreallocmemory.md) function.
     * @param {Integer} digitalWindowMode_ 
     * @param {DigitalWindowBounds} digitalWindowBounds_ 
     * @returns {HRESULT} If the function is successful (that is, if a current configuration exists), the return value is **TRUE**.
     * 
     * If the function is unsuccessful, the return value is **FALSE**.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/configure
     */
    ConfigureWithBounds(digitalWindowMode_, digitalWindowBounds_) {
        result := ComCall(11, this, "int", digitalWindowMode_, "ptr", digitalWindowBounds_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<DigitalWindowCapability>} 
     */
    get_SupportedCapabilities() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(DigitalWindowCapability, value)
    }

    /**
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {DigitalWindowCapability} 
     */
    GetCapabilityForSize(width, height) {
        result := ComCall(13, this, "int", width, "int", height, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DigitalWindowCapability(result_)
    }
}
