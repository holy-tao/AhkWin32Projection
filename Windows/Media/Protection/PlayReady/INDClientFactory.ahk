#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\NDClient.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class INDClientFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INDClientFactory
     * @type {Guid}
     */
    static IID => Guid("{3e53dd62-fee8-451f-b0d4-f706cca3e037}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {INDDownloadEngine} downloadEngine 
     * @param {INDStreamParser} streamParser 
     * @param {INDMessenger} pMessenger 
     * @returns {NDClient} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(downloadEngine, streamParser, pMessenger) {
        result := ComCall(6, this, "ptr", downloadEngine, "ptr", streamParser, "ptr", pMessenger, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NDClient(instance)
    }
}
