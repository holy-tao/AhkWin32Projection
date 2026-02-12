#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TimedTextRegion.ahk
#Include .\TimedTextStyle.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\TimedTextLine.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class ITimedTextCue extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimedTextCue
     * @type {Guid}
     */
    static IID => Guid("{51c79e51-3b86-494d-b359-bb2ea7aca9a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CueRegion", "put_CueRegion", "get_CueStyle", "put_CueStyle", "get_Lines"]

    /**
     * @type {TimedTextRegion} 
     */
    CueRegion {
        get => this.get_CueRegion()
        set => this.put_CueRegion(value)
    }

    /**
     * @type {TimedTextStyle} 
     */
    CueStyle {
        get => this.get_CueStyle()
        set => this.put_CueStyle(value)
    }

    /**
     * @type {IVector<TimedTextLine>} 
     */
    Lines {
        get => this.get_Lines()
    }

    /**
     * 
     * @returns {TimedTextRegion} 
     */
    get_CueRegion() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimedTextRegion(value)
    }

    /**
     * 
     * @param {TimedTextRegion} value 
     * @returns {HRESULT} 
     */
    put_CueRegion(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimedTextStyle} 
     */
    get_CueStyle() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimedTextStyle(value)
    }

    /**
     * 
     * @param {TimedTextStyle} value 
     * @returns {HRESULT} 
     */
    put_CueStyle(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<TimedTextLine>} 
     */
    get_Lines() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(TimedTextLine, value)
    }
}
