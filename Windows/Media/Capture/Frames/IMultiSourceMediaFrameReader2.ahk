#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class IMultiSourceMediaFrameReader2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMultiSourceMediaFrameReader2
     * @type {Guid}
     */
    static IID => Guid("{ef5c8abd-fc5c-4c6b-9d81-3cb9cc637c26}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_AcquisitionMode", "get_AcquisitionMode"]

    /**
     * @type {Integer} 
     */
    AcquisitionMode {
        get => this.get_AcquisitionMode()
        set => this.put_AcquisitionMode(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AcquisitionMode(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AcquisitionMode() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
