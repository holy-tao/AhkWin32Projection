#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpeechBaseStream.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechCustomStream extends ISpeechBaseStream{
    /**
     * The interface identifier for ISpeechCustomStream
     * @type {Guid}
     */
    static IID => Guid("{1a9e9f4f-104f-4db8-a115-efd7fd0c97ae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnkStream 
     * @returns {HRESULT} 
     */
    get_BaseStream(ppUnkStream) {
        result := ComCall(12, this, "ptr", ppUnkStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkStream 
     * @returns {HRESULT} 
     */
    putref_BaseStream(pUnkStream) {
        result := ComCall(13, this, "ptr", pUnkStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
