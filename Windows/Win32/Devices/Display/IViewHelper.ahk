#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class IViewHelper extends IUnknown{
    /**
     * The interface identifier for IViewHelper
     * @type {Guid}
     */
    static IID => Guid("{e85ccef5-aaaa-47f0-b5e3-61f7aecdc4c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} wszAdaptorName 
     * @param {Pointer<UInt32>} pulCount 
     * @param {Pointer<UInt32>} pulID 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    GetConnectedIDs(wszAdaptorName, pulCount, pulID, ulFlags) {
        wszAdaptorName := wszAdaptorName is String ? StrPtr(wszAdaptorName) : wszAdaptorName

        result := ComCall(3, this, "ptr", wszAdaptorName, "uint*", pulCount, "uint*", pulID, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszAdaptorName 
     * @param {Integer} ulSourceID 
     * @param {Pointer<UInt32>} pulCount 
     * @param {Pointer<UInt32>} pulTargetID 
     * @returns {HRESULT} 
     */
    GetActiveTopology(wszAdaptorName, ulSourceID, pulCount, pulTargetID) {
        wszAdaptorName := wszAdaptorName is String ? StrPtr(wszAdaptorName) : wszAdaptorName

        result := ComCall(4, this, "ptr", wszAdaptorName, "uint", ulSourceID, "uint*", pulCount, "uint*", pulTargetID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszAdaptorName 
     * @param {Integer} ulSourceID 
     * @param {Integer} ulCount 
     * @param {Pointer<UInt32>} pulTargetID 
     * @returns {HRESULT} 
     */
    SetActiveTopology(wszAdaptorName, ulSourceID, ulCount, pulTargetID) {
        wszAdaptorName := wszAdaptorName is String ? StrPtr(wszAdaptorName) : wszAdaptorName

        result := ComCall(5, this, "ptr", wszAdaptorName, "uint", ulSourceID, "uint", ulCount, "uint*", pulTargetID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Commit() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pIStream 
     * @param {Pointer<UInt32>} pulStatus 
     * @returns {HRESULT} 
     */
    SetConfiguration(pIStream, pulStatus) {
        result := ComCall(7, this, "ptr", pIStream, "uint*", pulStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GetProceedOnNewConfiguration() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
