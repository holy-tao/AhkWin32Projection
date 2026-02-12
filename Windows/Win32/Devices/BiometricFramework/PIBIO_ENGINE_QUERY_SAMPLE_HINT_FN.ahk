#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Retrieves the number of correct samples required by the engine adapter to construct an enrollment template.
 * @remarks
 * If an engine adapter requires a different number of samples in different situations, you should return the largest number. For example, if a fingerprint engine requires more swipes for an index finger than for a thumb, return the number required for the index finger.
 * 
 * The value returned by the <i>SampleHint</i> parameter specifies the number of correct samples required. Because of bad captures, the actual number of samples required during enrollment may be larger than the number specified.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_engine_query_sample_hint_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_ENGINE_QUERY_SAMPLE_HINT_FN extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline) {
        result := ComCall(3, this, "ptr", Pipeline, "ptr*", &SampleHint := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SampleHint
    }
}
