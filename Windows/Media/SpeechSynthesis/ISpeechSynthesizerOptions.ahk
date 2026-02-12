#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.SpeechSynthesis
 * @version WindowsRuntime 1.4
 */
class ISpeechSynthesizerOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechSynthesizerOptions
     * @type {Guid}
     */
    static IID => Guid("{a0e23871-cc3d-43c9-91b1-ee185324d83d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IncludeWordBoundaryMetadata", "put_IncludeWordBoundaryMetadata", "get_IncludeSentenceBoundaryMetadata", "put_IncludeSentenceBoundaryMetadata"]

    /**
     * @type {Boolean} 
     */
    IncludeWordBoundaryMetadata {
        get => this.get_IncludeWordBoundaryMetadata()
        set => this.put_IncludeWordBoundaryMetadata(value)
    }

    /**
     * @type {Boolean} 
     */
    IncludeSentenceBoundaryMetadata {
        get => this.get_IncludeSentenceBoundaryMetadata()
        set => this.put_IncludeSentenceBoundaryMetadata(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeWordBoundaryMetadata() {
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
    put_IncludeWordBoundaryMetadata(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeSentenceBoundaryMetadata() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_IncludeSentenceBoundaryMetadata(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
