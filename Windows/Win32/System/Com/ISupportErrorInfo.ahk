#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ISupportErrorInfo extends IUnknown{
    /**
     * The interface identifier for ISupportErrorInfo
     * @type {Guid}
     */
    static IID => Guid("{df0b3d60-548f-101b-8e65-08002b2bd119}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {HRESULT} 
     */
    InterfaceSupportsErrorInfo(riid) {
        result := ComCall(3, this, "ptr", riid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
