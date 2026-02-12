#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IRegionsOfInterestControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRegionsOfInterestControl
     * @type {Guid}
     */
    static IID => Guid("{c323f527-ab0b-4558-8b5b-df5693db0378}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaxRegions", "SetRegionsAsync", "SetRegionsWithLockAsync", "ClearRegionsAsync", "get_AutoFocusSupported", "get_AutoWhiteBalanceSupported", "get_AutoExposureSupported"]

    /**
     * @type {Integer} 
     */
    MaxRegions {
        get => this.get_MaxRegions()
    }

    /**
     * @type {Boolean} 
     */
    AutoFocusSupported {
        get => this.get_AutoFocusSupported()
    }

    /**
     * @type {Boolean} 
     */
    AutoWhiteBalanceSupported {
        get => this.get_AutoWhiteBalanceSupported()
    }

    /**
     * @type {Boolean} 
     */
    AutoExposureSupported {
        get => this.get_AutoExposureSupported()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxRegions() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IIterable<RegionOfInterest>} regions 
     * @returns {IAsyncAction} 
     */
    SetRegionsAsync(regions) {
        result := ComCall(7, this, "ptr", regions, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {IIterable<RegionOfInterest>} regions 
     * @param {Boolean} lockValues 
     * @returns {IAsyncAction} 
     */
    SetRegionsWithLockAsync(regions, lockValues) {
        result := ComCall(8, this, "ptr", regions, "int", lockValues, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ClearRegionsAsync() {
        result := ComCall(9, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoFocusSupported() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoWhiteBalanceSupported() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoExposureSupported() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
