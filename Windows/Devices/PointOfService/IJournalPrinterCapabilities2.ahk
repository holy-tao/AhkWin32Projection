#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IJournalPrinterCapabilities2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJournalPrinterCapabilities2
     * @type {Guid}
     */
    static IID => Guid("{03b0b645-33b8-533b-baaa-a4389283ab0a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsReverseVideoSupported", "get_IsStrikethroughSupported", "get_IsSuperscriptSupported", "get_IsSubscriptSupported", "get_IsReversePaperFeedByLineSupported", "get_IsReversePaperFeedByMapModeUnitSupported"]

    /**
     * @type {Boolean} 
     */
    IsReverseVideoSupported {
        get => this.get_IsReverseVideoSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsStrikethroughSupported {
        get => this.get_IsStrikethroughSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsSuperscriptSupported {
        get => this.get_IsSuperscriptSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsSubscriptSupported {
        get => this.get_IsSubscriptSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsReversePaperFeedByLineSupported {
        get => this.get_IsReversePaperFeedByLineSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsReversePaperFeedByMapModeUnitSupported {
        get => this.get_IsReversePaperFeedByMapModeUnitSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReverseVideoSupported() {
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
    get_IsStrikethroughSupported() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSuperscriptSupported() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSubscriptSupported() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReversePaperFeedByLineSupported() {
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
    get_IsReversePaperFeedByMapModeUnitSupported() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
