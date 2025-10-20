#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Implement this interface to receive notifications of the current track-writing operation.
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-ddiscformat2trackatonceevents
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class DDiscFormat2TrackAtOnceEvents extends IDispatch{
    /**
     * The interface identifier for DDiscFormat2TrackAtOnceEvents
     * @type {Guid}
     */
    static IID => Guid("{2735413f-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The class identifier for DDiscFormat2TrackAtOnceEvents
     * @type {Guid}
     */
    static CLSID => Guid("{2735413f-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IDispatch>} object 
     * @param {Pointer<IDispatch>} progress 
     * @returns {HRESULT} 
     */
    Update(object, progress) {
        result := ComCall(7, this, "ptr", object, "ptr", progress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
