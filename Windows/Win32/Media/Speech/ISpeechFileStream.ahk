#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISpeechBaseStream.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechFileStream extends ISpeechBaseStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechFileStream
     * @type {Guid}
     */
    static IID => Guid("{af67f125-ab39-4e93-b4a2-cc2e66e182a7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Close"]

    /**
     * 
     * @param {BSTR} FileName 
     * @param {Integer} FileMode 
     * @param {VARIANT_BOOL} DoEvents 
     * @returns {HRESULT} 
     */
    Open(FileName, FileMode, DoEvents) {
        FileName := FileName is String ? BSTR.Alloc(FileName).Value : FileName

        result := ComCall(12, this, "ptr", FileName, "int", FileMode, "short", DoEvents, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(13, this, "HRESULT")
        return result
    }
}
