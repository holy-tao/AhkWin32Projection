#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HMODULE.ahk
#Include .\ICorConfiguration.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICorRuntimeHost extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorRuntimeHost
     * @type {Guid}
     */
    static IID => Guid("{cb2f6722-ab3a-11d2-9c40-00c04fa30a3e}")

    /**
     * The class identifier for CorRuntimeHost
     * @type {Guid}
     */
    static CLSID => Guid("{cb2f6723-ab3a-11d2-9c40-00c04fa30a3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateLogicalThreadState", "DeleteLogicalThreadState", "SwitchInLogicalThreadState", "SwitchOutLogicalThreadState", "LocksHeldByLogicalThread", "MapFile", "GetConfiguration", "Start", "Stop", "CreateDomain", "GetDefaultDomain", "EnumDomains", "NextDomain", "CloseEnum", "CreateDomainEx", "CreateDomainSetup", "CreateEvidence", "UnloadDomain", "CurrentDomain"]

    /**
     * 
     * @returns {HRESULT} 
     */
    CreateLogicalThreadState() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteLogicalThreadState() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFiberCookie 
     * @returns {HRESULT} 
     */
    SwitchInLogicalThreadState(pFiberCookie) {
        pFiberCookieMarshal := pFiberCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pFiberCookieMarshal, pFiberCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    SwitchOutLogicalThreadState() {
        result := ComCall(6, this, "ptr*", &pFiberCookie := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pFiberCookie
    }

    /**
     * 
     * @returns {Integer} 
     */
    LocksHeldByLogicalThread() {
        result := ComCall(7, this, "uint*", &pCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCount
    }

    /**
     * Computes the checksum of the specified file. (Unicode)
     * @remarks
     * The 
     * <b>MapFileAndCheckSum</b> function computes a new checksum for the file and returns it in the <i>CheckSum</i> parameter. This function is used by any application that creates or modifies an executable image. Checksums are required for kernel-mode drivers and some system DLLs. The linker computes the original checksum at link time, if you use the appropriate linker switch. For more details, see your linker documentation.
     * 
     * It is recommended that all images have valid checksums. It is the caller's responsibility to place the newly computed checksum into the mapped image and update the on-disk image of the file.
     * 
     * Passing a <i>Filename</i> parameter that does not point to a valid executable image will produce unpredictable results.  Any user of this function is encouraged to make sure that a valid executable image is being passed.
     * 
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * <div class="alert"><b>Note</b>  The Unicode implementation of this function calls the ASCII implementation and as a result, the function can fail if the codepage does not support the characters in the path. For example, if you pass a non-English Unicode file path, and the default codepage is English, the unrecognized non-English wide chars are converted to "??" and the file cannot be opened (the function returns CHECKSUM_OPEN_FAILURE).</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The imagehlp.h header defines MapFileAndCheckSum as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HANDLE} hFile 
     * @returns {HMODULE} 
     * @see https://learn.microsoft.com/windows/win32/api//content/imagehlp/nf-imagehlp-mapfileandchecksumw
     */
    MapFile(hFile) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        hMapAddress := HMODULE()
        result := ComCall(8, this, "ptr", hFile, "ptr", hMapAddress, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return hMapAddress
    }

    /**
     * Read the active configuration of the collector.
     * @returns {ICorConfiguration} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/BEvtColProv/control-getconfiguration
     */
    GetConfiguration() {
        result := ComCall(9, this, "ptr*", &pConfiguration := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICorConfiguration(pConfiguration)
    }

    /**
     * Specifies the date and time when the trigger is activated.
     * @remarks
     * The **&lt;StartBoundary&gt;** element is a required element for time and calendar triggers ([**&lt;TimeTrigger&gt;**](taskschedulerschema-timetrigger-triggergroup-element.md) and [**&lt;CalendarTrigger&gt;**](taskschedulerschema-calendartrigger-triggergroup-element.md)).
     * 
     * For scripting development, the end boundary is specified using the [**Trigger.StartBoundary**](trigger-startboundary.md) property that is inherited by the all trigger objects.
     * 
     * For C++ development, the end boundary is specified using the [**ITrigger::StartBoundary**](/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_startboundary) property that is inherited by the all trigger interfaces.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-startboundary-triggerbasetype-element
     */
    Start() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies that a running instances of the task is stopped at the end of the repetition pattern duration.
     * @remarks
     * For scripting development, this setting is specified using the [**RepetitionPattern.StopAtDurationEnd**](repetitionpattern-stopatdurationend.md) property.
     * 
     * For C++ development, this setting is specified using the [**IRepetitionPattern::StopAtDurationEnd**](/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-get_stopatdurationend) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-stopatdurationend-repetitiontype-element
     */
    Stop() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFriendlyName 
     * @param {IUnknown} pIdentityArray 
     * @returns {IUnknown} 
     */
    CreateDomain(pwzFriendlyName, pIdentityArray) {
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := ComCall(12, this, "ptr", pwzFriendlyName, "ptr", pIdentityArray, "ptr*", &pAppDomain := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(pAppDomain)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    GetDefaultDomain() {
        result := ComCall(13, this, "ptr*", &pAppDomain := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(pAppDomain)
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    EnumDomains() {
        result := ComCall(14, this, "ptr*", &hEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return hEnum
    }

    /**
     * 
     * @param {Pointer<Void>} hEnum 
     * @returns {IUnknown} 
     */
    NextDomain(hEnum) {
        hEnumMarshal := hEnum is VarRef ? "ptr" : "ptr"

        result := ComCall(15, this, hEnumMarshal, hEnum, "ptr*", &pAppDomain := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(pAppDomain)
    }

    /**
     * 
     * @param {Pointer<Void>} hEnum 
     * @returns {HRESULT} 
     */
    CloseEnum(hEnum) {
        hEnumMarshal := hEnum is VarRef ? "ptr" : "ptr"

        result := ComCall(16, this, hEnumMarshal, hEnum, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFriendlyName 
     * @param {IUnknown} pSetup 
     * @param {IUnknown} pEvidence 
     * @returns {IUnknown} 
     */
    CreateDomainEx(pwzFriendlyName, pSetup, pEvidence) {
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := ComCall(17, this, "ptr", pwzFriendlyName, "ptr", pSetup, "ptr", pEvidence, "ptr*", &pAppDomain := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(pAppDomain)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    CreateDomainSetup() {
        result := ComCall(18, this, "ptr*", &pAppDomainSetup := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(pAppDomainSetup)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    CreateEvidence() {
        result := ComCall(19, this, "ptr*", &pEvidence := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(pEvidence)
    }

    /**
     * 
     * @param {IUnknown} pAppDomain 
     * @returns {HRESULT} 
     */
    UnloadDomain(pAppDomain) {
        result := ComCall(20, this, "ptr", pAppDomain, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The CurrentDomain property retrieves the DVD domain that the MSWebDVD object is in.
     * @remarks
     * The possible values of the property are:
     * 
     * 
     * 
     * | Value | Description          |
     * |-------|----------------------|
     * | 1     | First play           |
     * | 2     | Video Manager Menu   |
     * | 3     | Video Title Set Menu |
     * | 4     | Title                |
     * | 5     | Stop                 |
     * 
     * 
     * 
     *  
     * 
     * Call this method to ensure that the DVD Navigator is in a valid domain for the method you are about to call. For example, before calling [**PlayTitle**](playtitle-method.md), check the `CurrentDomain` property to make sure that the DVD Navigator is not in the Stop or First Play domain.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/currentdomain-property
     */
    CurrentDomain() {
        result := ComCall(21, this, "ptr*", &pAppDomain := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(pAppDomain)
    }
}
