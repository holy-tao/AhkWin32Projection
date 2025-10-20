#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class AsyncIPipeByte extends IUnknown{
    /**
     * The interface identifier for AsyncIPipeByte
     * @type {Guid}
     */
    static IID => Guid("{db2f3acb-2f86-11d1-8e04-00c04fb9989a}")

    /**
     * The class identifier for AsyncIPipeByte
     * @type {Guid}
     */
    static CLSID => Guid("{db2f3acb-2f86-11d1-8e04-00c04fb9989a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cRequest 
     * @returns {HRESULT} 
     */
    Begin_Pull(cRequest) {
        result := ComCall(3, this, "uint", cRequest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} buf 
     * @param {Pointer<UInt32>} pcReturned 
     * @returns {HRESULT} 
     */
    Finish_Pull(buf, pcReturned) {
        result := ComCall(4, this, "char*", buf, "uint*", pcReturned, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} buf 
     * @param {Integer} cSent 
     * @returns {HRESULT} 
     */
    Begin_Push(buf, cSent) {
        result := ComCall(5, this, "char*", buf, "uint", cSent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_Push() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
