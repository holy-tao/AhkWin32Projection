#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\ISpeechBaseStream.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechCustomStream extends ISpeechBaseStream{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BaseStream", "putref_BaseStream"]

    /**
     * @type {IUnknown} 
     */
    BaseStream {
        get => this.get_BaseStream()
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_BaseStream() {
        result := ComCall(12, this, "ptr*", &ppUnkStream := 0, "HRESULT")
        return IUnknown(ppUnkStream)
    }

    /**
     * 
     * @param {IUnknown} pUnkStream 
     * @returns {HRESULT} 
     */
    putref_BaseStream(pUnkStream) {
        result := ComCall(13, this, "ptr", pUnkStream, "HRESULT")
        return result
    }
}
