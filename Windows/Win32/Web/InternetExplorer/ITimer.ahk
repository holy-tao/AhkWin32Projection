#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ITimer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimer
     * @type {Guid}
     */
    static IID => Guid("{3050f360-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Advise", "Unadvise", "Freeze", "GetTime"]

    /**
     * Stops the recognizer from processing ink because a stroke has been added or deleted.
     * @remarks
     * The <b>AdviseInkChange</b> function signals that there will be additional calls to the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-addstroke">AddStroke</a> function. This enables any recognition already in progress to stop at any convenient point. Recognition completion is one such point, so <b>AdviseInkChange</b> can safely do nothing.
     * 
     * For example, if you have two threads, one thread may be using <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-addstroke">AddStroke</a> and <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-process">Process</a> with other functions to obtain results. The other thread may be collecting ink, echoing it, and queuing tasks for the first thread. The second thread calls <b>AdviseInkChange</b> to notify the recognizer a change is coming. This enables the first thread to return to the caller sooner than without the call to <b>AdviseInkChange</b>. The first thread can then call the recognizer again with more ink.
     * 
     * If you set the bNewStroke parameter to <b>FALSE</b> because a stroke was modified or deleted, you must also call the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-resetcontext">ResetContext</a> function, and then call the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-addstroke">AddStroke</a> function to add the strokes from the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object to the recognizer context. This is done automatically if you attach the recognizer context to the <b>InkDisp</b> object.
     * @param {VARIANT} vtimeMin 
     * @param {VARIANT} vtimeMax 
     * @param {VARIANT} vtimeInterval 
     * @param {Integer} dwFlags 
     * @param {ITimerSink} pTimerSink 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/recapis/nf-recapis-adviseinkchange
     */
    Advise(vtimeMin, vtimeMax, vtimeInterval, dwFlags, pTimerSink) {
        result := ComCall(3, this, "ptr", vtimeMin, "ptr", vtimeMax, "ptr", vtimeInterval, "uint", dwFlags, "ptr", pTimerSink, "uint*", &pdwCookie := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwCookie
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    Unadvise(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BOOL} fFreeze 
     * @returns {HRESULT} 
     */
    Freeze(fFreeze) {
        result := ComCall(5, this, "int", fFreeze, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Formats time as a time string for a locale specified by identifier. The function formats either a specified time or the local system time. (Unicode)
     * @remarks
     * See Remarks for <a href="https://docs.microsoft.com/windows/desktop/api/datetimeapi/nf-datetimeapi-gettimeformatex">GetTimeFormatEx</a>.
     * 
     * When the ANSI version of this function is used with a Unicode-only locale identifier, the function can succeed because the operating system uses the system code page. However, characters that are undefined in the system code page appear in the string as a question mark (?). 
     *       
     * 
     * <b>Starting with Windows 8: </b><b>GetTimeFormat</b>  is declared in Datetimeapi.h. Before Windows 8, it was declared in Winnls.h.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The datetimeapi.h header defines GetTimeFormat as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/datetimeapi/nf-datetimeapi-gettimeformatw
     */
    GetTime() {
        pvtime := VARIANT()
        result := ComCall(6, this, "ptr", pvtime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvtime
    }
}
