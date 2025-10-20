#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INSSBuffer3.ahk

/**
 * The INSSBuffer4 interface provides methods to enumerate buffer properties.
 * @see https://docs.microsoft.com/windows/win32/api//wmsbuffer/nn-wmsbuffer-inssbuffer4
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class INSSBuffer4 extends INSSBuffer3{
    /**
     * The interface identifier for INSSBuffer4
     * @type {Guid}
     */
    static IID => Guid("{b6b8fd5a-32e2-49d4-a910-c26cc85465ed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * 
     * @param {Pointer<UInt32>} pcBufferProperties 
     * @returns {HRESULT} 
     */
    GetPropertyCount(pcBufferProperties) {
        result := ComCall(12, this, "uint*", pcBufferProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwBufferPropertyIndex 
     * @param {Pointer<Guid>} pguidBufferProperty 
     * @param {Pointer<Void>} pvBufferProperty 
     * @param {Pointer<UInt32>} pdwBufferPropertySize 
     * @returns {HRESULT} 
     */
    GetPropertyByIndex(dwBufferPropertyIndex, pguidBufferProperty, pvBufferProperty, pdwBufferPropertySize) {
        result := ComCall(13, this, "uint", dwBufferPropertyIndex, "ptr", pguidBufferProperty, "ptr", pvBufferProperty, "uint*", pdwBufferPropertySize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
