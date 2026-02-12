#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\CapturedFrame.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\CapturedFrameControlValues.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Core
 * @version WindowsRuntime 1.4
 */
class IVariablePhotoCapturedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVariablePhotoCapturedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{d1eb4c5c-1b53-4e4a-8b5c-db7887ac949b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Frame", "get_CaptureTimeOffset", "get_UsedFrameControllerIndex", "get_CapturedFrameControlValues"]

    /**
     * @type {CapturedFrame} 
     */
    Frame {
        get => this.get_Frame()
    }

    /**
     * @type {TimeSpan} 
     */
    CaptureTimeOffset {
        get => this.get_CaptureTimeOffset()
    }

    /**
     * @type {IReference<Integer>} 
     */
    UsedFrameControllerIndex {
        get => this.get_UsedFrameControllerIndex()
    }

    /**
     * @type {CapturedFrameControlValues} 
     */
    CapturedFrameControlValues {
        get => this.get_CapturedFrameControlValues()
    }

    /**
     * 
     * @returns {CapturedFrame} 
     */
    get_Frame() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CapturedFrame(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_CaptureTimeOffset() {
        value := TimeSpan()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_UsedFrameControllerIndex() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {CapturedFrameControlValues} 
     */
    get_CapturedFrameControlValues() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CapturedFrameControlValues(value)
    }
}
