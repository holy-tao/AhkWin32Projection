#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include ..\IEnumFilters.ahk
#Include .\IMSVidGraphSegmentContainer.ahk
#Include ..\..\..\System\Com\IPersist.ahk

/**
 * The IMSVidGraphSegmentContainer interface is exposed by the Video Control and contains one supported method, get_Graph, which obtains a pointer to the Filter Graph Manager.
 * @remarks
 * This interface has additional methods besides the one shown here, but they are not supported.
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidGraphSegmentContainer)</c>.
 * @see https://learn.microsoft.com/windows/win32/api//content/segment/nn-segment-imsvidgraphsegmentcontainer
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidGraphSegment extends IPersist{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidGraphSegment
     * @type {Guid}
     */
    static IID => Guid("{238dec54-adeb-4005-a349-f772b9afebc4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Init", "put_Init", "EnumFilters", "get_Container", "put_Container", "get_Type", "get_Category", "Build", "PostBuild", "PreRun", "PostRun", "PreStop", "PostStop", "OnEventNotify", "Decompose"]

    /**
     * @type {IUnknown} 
     */
    Init {
        get => this.get_Init()
        set => this.put_Init(value)
    }

    /**
     * @type {IMSVidGraphSegmentContainer} 
     */
    Container {
        get => this.get_Container()
        set => this.put_Container(value)
    }

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {Guid} 
     */
    Category {
        get => this.get_Category()
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_Init() {
        result := ComCall(4, this, "ptr*", &pInit := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(pInit)
    }

    /**
     * 
     * @param {IUnknown} pInit 
     * @returns {HRESULT} 
     */
    put_Init(pInit) {
        result := ComCall(5, this, "ptr", pInit, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IEnumFilters} 
     */
    EnumFilters() {
        result := ComCall(6, this, "ptr*", &pNewEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumFilters(pNewEnum)
    }

    /**
     * 
     * @returns {IMSVidGraphSegmentContainer} 
     */
    get_Container() {
        result := ComCall(7, this, "ptr*", &ppCtl := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMSVidGraphSegmentContainer(ppCtl)
    }

    /**
     * 
     * @param {IMSVidGraphSegmentContainer} pCtl 
     * @returns {HRESULT} 
     */
    put_Container(pCtl) {
        result := ComCall(8, this, "ptr", pCtl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(9, this, "int*", &pType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pType
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Category() {
        pGuid := Guid()
        result := ComCall(10, this, "ptr", pGuid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pGuid
    }

    /**
     * Fills a specified DCB structure with values specified in a device-control string. (Unicode)
     * @remarks
     * The 
     * <b>BuildCommDCB</b> function adjusts only those members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure that are specifically affected by the <i>lpDef</i> parameter, with the following exceptions:
     * 
     * <ul>
     * <li>If the specified baud rate is 110, the function sets the stop bits to 2 to remain compatible with the system's <b>mode</b> command.</li>
     * <li>By default, 
     * <b>BuildCommDCB</b> disables XON/XOFF and hardware flow control. To enable flow control, you must explicitly set the appropriate members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure.</li>
     * </ul>
     * The 
     * <b>BuildCommDCB</b> function only fills in the members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure. To apply these settings to a serial port, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcommstate">SetCommState</a> function.
     * 
     * There are older and newer forms of the <b>mode</b> syntax. The 
     * <b>BuildCommDCB</b> function supports both forms. However, you cannot mix the two forms together.
     * 
     * The newer form of the <b>mode</b> syntax lets you explicitly set the values of the flow control members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure. If you use an older form of the <b>mode</b> syntax, the 
     * <b>BuildCommDCB</b> function sets the flow control members of the 
     * <b>DCB</b> structure, as follows:
     * 
     * <ul>
     * <li>For a string that does not end with an x or a p: 
     * 
     * 
     * <ul>
     * <li><b>fInX</b>, <b>fOutX</b>, <b>fOutXDsrFlow</b>, and <b>fOutXCtsFlow</b> are all set to <b>FALSE</b></li>
     * <li><b>fDtrControl</b> is set to DTR_CONTROL_ENABLE</li>
     * <li><b>fRtsControl</b> is set to RTS_CONTROL_ENABLE</li>
     * </ul>
     * </li>
     * <li>For a string that ends with an x: 
     * 
     * 
     * <ul>
     * <li><b>fInX</b> and <b>fOutX</b> are both set to <b>TRUE</b></li>
     * <li><b>fOutXDsrFlow</b> and <b>fOutXCtsFlow</b> are both set to <b>FALSE</b></li>
     * <li><b>fDtrControl</b> is set to DTR_CONTROL_ENABLE</li>
     * <li><b>fRtsControl</b> is set to RTS_CONTROL_ENABLE</li>
     * </ul>
     * </li>
     * <li>For a string that ends with a p: 
     * 
     * 
     * <ul>
     * <li><b>fInX</b> and <b>fOutX</b> are both set to <b>FALSE</b></li>
     * <li><b>fOutXDsrFlow</b> and <b>fOutXCtsFlow</b> are both set to <b>TRUE</b></li>
     * <li><b>fDtrControl</b> is set to DTR_CONTROL_HANDSHAKE</li>
     * <li><b>fRtsControl</b> is set to RTS_CONTROL_HANDSHAKE</li>
     * </ul>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines BuildCommDCB as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-buildcommdcbw
     */
    Build() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PostBuild() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PreRun() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PostRun() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PreStop() {
        result := ComCall(15, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PostStop() {
        result := ComCall(16, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} lEventCode 
     * @param {Pointer} lEventParm1 
     * @param {Pointer} lEventParm2 
     * @returns {HRESULT} 
     */
    OnEventNotify(lEventCode, lEventParm1, lEventParm2) {
        result := ComCall(17, this, "int", lEventCode, "ptr", lEventParm1, "ptr", lEventParm2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Decompose() {
        result := ComCall(18, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
