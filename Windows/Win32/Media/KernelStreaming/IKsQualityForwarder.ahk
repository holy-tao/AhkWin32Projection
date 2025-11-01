#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IKsObject.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsQualityForwarder extends IKsObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKsQualityForwarder
     * @type {Guid}
     */
    static IID => Guid("{97ebaacb-95bd-11d0-a3ea-00a0c9223196}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["KsFlushClient"]

    /**
     * 
     * @param {IKsPin} Pin 
     * @returns {String} Nothing - always returns an empty string
     */
    KsFlushClient(Pin) {
        ComCall(4, this, "ptr", Pin)
    }
}
