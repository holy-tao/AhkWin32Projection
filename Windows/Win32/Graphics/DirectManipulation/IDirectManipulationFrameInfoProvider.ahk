#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a time-keeping object that measures the latency of the composition infrastructure used by the application and provides this data to Direct Manipulation.
 * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nn-directmanipulation-idirectmanipulationframeinfoprovider
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationFrameInfoProvider extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNextFrameInfo"]

    /**
     * Retrieves the composition timing information from the compositor.
     * @remarks
     * The system implementation of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationframeinfoprovider">IDirectManipulationFrameInfoProvider</a> uses <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-portal">DirectComposition</a>. <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositiondevice-getframestatistics">GetFrameStatistics</a> is used to calculate the parameter values for <b>GetNextFrameInfo</b>.
     * @param {Pointer<Integer>} time The current time, in milliseconds.
     * @param {Pointer<Integer>} processTime The time, in milliseconds, when the compositor begins constructing the next frame.
     * @param {Pointer<Integer>} compositionTime The time, in milliseconds, when the compositor finishes composing and drawing the next frame on the screen.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nf-directmanipulation-idirectmanipulationframeinfoprovider-getnextframeinfo
     */
    GetNextFrameInfo(time, processTime, compositionTime) {
        timeMarshal := time is VarRef ? "uint*" : "ptr"
        processTimeMarshal := processTime is VarRef ? "uint*" : "ptr"
        compositionTimeMarshal := compositionTime is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, timeMarshal, time, processTimeMarshal, processTime, compositionTimeMarshal, compositionTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
