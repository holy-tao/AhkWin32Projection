#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Preview.GamesEnumeration
 * @version WindowsRuntime 1.4
 */
class IGameModeConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameModeConfiguration
     * @type {Guid}
     */
    static IID => Guid("{78e591af-b142-4ef0-8830-55bc2be4f5ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsEnabled", "put_IsEnabled", "get_RelatedProcessNames", "get_PercentGpuTimeAllocatedToGame", "put_PercentGpuTimeAllocatedToGame", "get_PercentGpuMemoryAllocatedToGame", "put_PercentGpuMemoryAllocatedToGame", "get_PercentGpuMemoryAllocatedToSystemCompositor", "put_PercentGpuMemoryAllocatedToSystemCompositor", "get_MaxCpuCount", "put_MaxCpuCount", "get_CpuExclusivityMaskLow", "put_CpuExclusivityMaskLow", "get_CpuExclusivityMaskHigh", "put_CpuExclusivityMaskHigh", "get_AffinitizeToExclusiveCpus", "put_AffinitizeToExclusiveCpus", "SaveAsync"]

    /**
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    RelatedProcessNames {
        get => this.get_RelatedProcessNames()
    }

    /**
     * @type {IReference<Integer>} 
     */
    PercentGpuTimeAllocatedToGame {
        get => this.get_PercentGpuTimeAllocatedToGame()
        set => this.put_PercentGpuTimeAllocatedToGame(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    PercentGpuMemoryAllocatedToGame {
        get => this.get_PercentGpuMemoryAllocatedToGame()
        set => this.put_PercentGpuMemoryAllocatedToGame(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    PercentGpuMemoryAllocatedToSystemCompositor {
        get => this.get_PercentGpuMemoryAllocatedToSystemCompositor()
        set => this.put_PercentGpuMemoryAllocatedToSystemCompositor(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    MaxCpuCount {
        get => this.get_MaxCpuCount()
        set => this.put_MaxCpuCount(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    CpuExclusivityMaskLow {
        get => this.get_CpuExclusivityMaskLow()
        set => this.put_CpuExclusivityMaskLow(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    CpuExclusivityMaskHigh {
        get => this.get_CpuExclusivityMaskHigh()
        set => this.put_CpuExclusivityMaskHigh(value)
    }

    /**
     * @type {Boolean} 
     */
    AffinitizeToExclusiveCpus {
        get => this.get_AffinitizeToExclusiveCpus()
        set => this.put_AffinitizeToExclusiveCpus(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_IsEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_RelatedProcessNames() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PercentGpuTimeAllocatedToGame() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_PercentGpuTimeAllocatedToGame(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PercentGpuMemoryAllocatedToGame() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_PercentGpuMemoryAllocatedToGame(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PercentGpuMemoryAllocatedToSystemCompositor() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_PercentGpuMemoryAllocatedToSystemCompositor(value) {
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxCpuCount() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxCpuCount(value) {
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_CpuExclusivityMaskLow() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_CpuExclusivityMaskLow(value) {
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_CpuExclusivityMaskHigh() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_CpuExclusivityMaskHigh(value) {
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AffinitizeToExclusiveCpus() {
        result := ComCall(21, this, "int*", &value := 0, "int")
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
    put_AffinitizeToExclusiveCpus(value) {
        result := ComCall(22, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    SaveAsync() {
        result := ComCall(23, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
