#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a time-keeping object that measures the latency of the composition infrastructure used by the application and provides this data to Direct Manipulation.
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nn-directmanipulation-idirectmanipulationframeinfoprovider
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationFrameInfoProvider extends IUnknown{
    /**
     * The interface identifier for IDirectManipulationFrameInfoProvider
     * @type {Guid}
     */
    static IID => Guid("{fb759dba-6f4c-4c01-874e-19c8a05907f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt64>} time 
     * @param {Pointer<UInt64>} processTime 
     * @param {Pointer<UInt64>} compositionTime 
     * @returns {HRESULT} 
     */
    GetNextFrameInfo(time, processTime, compositionTime) {
        result := ComCall(3, this, "uint*", time, "uint*", processTime, "uint*", compositionTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
