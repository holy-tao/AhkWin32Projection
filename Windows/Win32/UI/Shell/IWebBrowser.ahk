#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Exposes methods that are implemented by the WebBrowser control (Microsoft ActiveX control) or implemented by an instance of the InternetExplorer application (OLE Automation).
 * @see https://learn.microsoft.com/windows/win32/api/exdisp/nn-exdisp-iwebbrowser2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IWebBrowser extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebBrowser
     * @type {Guid}
     */
    static IID => Guid("{eab22ac1-30c1-11cf-a7eb-0000c05bae0b}")

    /**
     * The class identifier for WebBrowser
     * @type {Guid}
     */
    static CLSID => Guid("{8856f961-340a-11d0-a96b-00c04fd705a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GoBack", "GoForward", "GoHome", "GoSearch", "Navigate", "Refresh", "Refresh2", "Stop", "get_Application", "get_Parent", "get_Container", "get_Document", "get_TopLevelContainer", "get_Type", "get_Left", "put_Left", "get_Top", "put_Top", "get_Width", "put_Width", "get_Height", "put_Height", "get_LocationName", "get_LocationURL", "get_Busy"]

    /**
     * @type {IDispatch} 
     */
    Application {
        get => this.get_Application()
    }

    /**
     * @type {IDispatch} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {IDispatch} 
     */
    Container {
        get => this.get_Container()
    }

    /**
     * @type {IDispatch} 
     */
    Document {
        get => this.get_Document()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    TopLevelContainer {
        get => this.get_TopLevelContainer()
    }

    /**
     * @type {BSTR} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {Integer} 
     */
    Left {
        get => this.get_Left()
        set => this.put_Left(value)
    }

    /**
     * @type {Integer} 
     */
    Top {
        get => this.get_Top()
        set => this.put_Top(value)
    }

    /**
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
        set => this.put_Width(value)
    }

    /**
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
        set => this.put_Height(value)
    }

    /**
     * @type {BSTR} 
     */
    LocationName {
        get => this.get_LocationName()
    }

    /**
     * @type {BSTR} 
     */
    LocationURL {
        get => this.get_LocationURL()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Busy {
        get => this.get_Busy()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GoBack() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GoForward() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GoHome() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GoSearch() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Note This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Navigate element specifies a URL used by calls to External.NavigateTaskPaneURL.
     * @param {BSTR} URL 
     * @param {Pointer<VARIANT>} Flags 
     * @param {Pointer<VARIANT>} TargetFrameName 
     * @param {Pointer<VARIANT>} PostData 
     * @param {Pointer<VARIANT>} Headers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WMP/navigate-element
     */
    Navigate(URL, Flags, TargetFrameName, PostData, Headers) {
        URL := URL is String ? BSTR.Alloc(URL).Value : URL

        result := ComCall(11, this, "ptr", URL, "ptr", Flags, "ptr", TargetFrameName, "ptr", PostData, "ptr", Headers, "HRESULT")
        return result
    }

    /**
     * RefreshIscsiSendTargetPortal function instructs the iSCSI initiator service to establish a discovery session with the indicated target portal and transmit a SendTargets request to refresh the list of discovered targets for the iSCSI initiator service. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines RefreshIScsiSendTargetPortal as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {HRESULT} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-refreshiscsisendtargetportala
     */
    Refresh() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Level 
     * @returns {HRESULT} 
     */
    Refresh2(Level) {
        result := ComCall(13, this, "ptr", Level, "HRESULT")
        return result
    }

    /**
     * Specifies that a running instances of the task is stopped at the end of the repetition pattern duration.
     * @remarks
     * For scripting development, this setting is specified using the [**RepetitionPattern.StopAtDurationEnd**](repetitionpattern-stopatdurationend.md) property.
     * 
     * For C++ development, this setting is specified using the [**IRepetitionPattern::StopAtDurationEnd**](/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-get_stopatdurationend) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-stopatdurationend-repetitiontype-element
     */
    Stop() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Application() {
        result := ComCall(15, this, "ptr*", &ppDisp := 0, "HRESULT")
        return IDispatch(ppDisp)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Parent() {
        result := ComCall(16, this, "ptr*", &ppDisp := 0, "HRESULT")
        return IDispatch(ppDisp)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Container() {
        result := ComCall(17, this, "ptr*", &ppDisp := 0, "HRESULT")
        return IDispatch(ppDisp)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Document() {
        result := ComCall(18, this, "ptr*", &ppDisp := 0, "HRESULT")
        return IDispatch(ppDisp)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_TopLevelContainer() {
        result := ComCall(19, this, "short*", &pBool := 0, "HRESULT")
        return pBool
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Type() {
        Type := BSTR()
        result := ComCall(20, this, "ptr", Type, "HRESULT")
        return Type
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Left() {
        result := ComCall(21, this, "int*", &pl := 0, "HRESULT")
        return pl
    }

    /**
     * 
     * @param {Integer} Left 
     * @returns {HRESULT} 
     */
    put_Left(Left) {
        result := ComCall(22, this, "int", Left, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Top() {
        result := ComCall(23, this, "int*", &pl := 0, "HRESULT")
        return pl
    }

    /**
     * 
     * @param {Integer} Top 
     * @returns {HRESULT} 
     */
    put_Top(Top) {
        result := ComCall(24, this, "int", Top, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        result := ComCall(25, this, "int*", &pl := 0, "HRESULT")
        return pl
    }

    /**
     * 
     * @param {Integer} Width 
     * @returns {HRESULT} 
     */
    put_Width(Width) {
        result := ComCall(26, this, "int", Width, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        result := ComCall(27, this, "int*", &pl := 0, "HRESULT")
        return pl
    }

    /**
     * 
     * @param {Integer} Height 
     * @returns {HRESULT} 
     */
    put_Height(Height) {
        result := ComCall(28, this, "int", Height, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LocationName() {
        LocationName := BSTR()
        result := ComCall(29, this, "ptr", LocationName, "HRESULT")
        return LocationName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LocationURL() {
        LocationURL := BSTR()
        result := ComCall(30, this, "ptr", LocationURL, "HRESULT")
        return LocationURL
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Busy() {
        result := ComCall(31, this, "short*", &pBool := 0, "HRESULT")
        return pBool
    }
}
