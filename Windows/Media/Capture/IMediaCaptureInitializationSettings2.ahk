#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IMediaCaptureInitializationSettings2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaCaptureInitializationSettings2
     * @type {Guid}
     */
    static IID => Guid("{404e0626-c9dc-43e9-aee4-e6bf1b57b44c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_MediaCategory", "get_MediaCategory", "put_AudioProcessing", "get_AudioProcessing"]

    /**
     * @type {Integer} 
     */
    MediaCategory {
        get => this.get_MediaCategory()
        set => this.put_MediaCategory(value)
    }

    /**
     * @type {Integer} 
     */
    AudioProcessing {
        get => this.get_AudioProcessing()
        set => this.put_AudioProcessing(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MediaCategory(value) {
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
    get_MediaCategory() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AudioProcessing(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioProcessing() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
