#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IFocusControl2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFocusControl2
     * @type {Guid}
     */
    static IID => Guid("{3f7cff48-c534-4e9e-94c3-52ef2afd5d07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FocusChangedSupported", "get_WaitForFocusSupported", "get_SupportedFocusModes", "get_SupportedFocusDistances", "get_SupportedFocusRanges", "get_Mode", "get_FocusState", "UnlockAsync", "LockAsync", "Configure"]

    /**
     * @type {Boolean} 
     */
    FocusChangedSupported {
        get => this.get_FocusChangedSupported()
    }

    /**
     * @type {Boolean} 
     */
    WaitForFocusSupported {
        get => this.get_WaitForFocusSupported()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedFocusModes {
        get => this.get_SupportedFocusModes()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedFocusDistances {
        get => this.get_SupportedFocusDistances()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedFocusRanges {
        get => this.get_SupportedFocusRanges()
    }

    /**
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
    }

    /**
     * @type {Integer} 
     */
    FocusState {
        get => this.get_FocusState()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_FocusChangedSupported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_WaitForFocusSupported() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedFocusModes() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedFocusDistances() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedFocusRanges() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FocusState() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    UnlockAsync() {
        result := ComCall(13, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    LockAsync() {
        result := ComCall(14, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
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
     * @param {FocusSettings} settings 
     * @returns {HRESULT} If the function is successful (that is, if a current configuration exists), the return value is **TRUE**.
     * 
     * If the function is unsuccessful, the return value is **FALSE**.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/configure
     */
    Configure(settings) {
        result := ComCall(15, this, "ptr", settings, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
