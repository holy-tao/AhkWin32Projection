#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class ISystemVideoProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemVideoProperties
     * @type {Guid}
     */
    static IID => Guid("{2040f715-67f8-4322-9b80-4fa9fefb83e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Director", "get_FrameHeight", "get_FrameWidth", "get_Orientation", "get_TotalBitrate"]

    /**
     * @type {HSTRING} 
     */
    Director {
        get => this.get_Director()
    }

    /**
     * @type {HSTRING} 
     */
    FrameHeight {
        get => this.get_FrameHeight()
    }

    /**
     * @type {HSTRING} 
     */
    FrameWidth {
        get => this.get_FrameWidth()
    }

    /**
     * @type {HSTRING} 
     */
    Orientation {
        get => this.get_Orientation()
    }

    /**
     * @type {HSTRING} 
     */
    TotalBitrate {
        get => this.get_TotalBitrate()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Director() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FrameHeight() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FrameWidth() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Orientation() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TotalBitrate() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
