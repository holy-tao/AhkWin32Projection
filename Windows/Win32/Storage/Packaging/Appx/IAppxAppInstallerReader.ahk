#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Data\Xml\MsXml\IXMLDOMDocument.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides access to the XML DOM for an App Installer file.
 * @remarks
 * Get an instance of this interface by calling [IAppxFactory3::CreateAppInstallerReader](nf-appxpackaging-iappxfactory3-createappinstallerreader.md).
 * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nn-appxpackaging-iappxappinstallerreader
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxAppInstallerReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxAppInstallerReader
     * @type {Guid}
     */
    static IID => Guid("{f35bc38c-1d2f-43db-a1f4-586430d1fed2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetXmlDom"]

    /**
     * Gets the XML DOM for an App Installer file.
     * @returns {IXMLDOMDocument} Receives a pointer to [IXMLDOMDocument](/previous-versions/windows/desktop/ms756987(v=vs.85)) representing the XML DOM for the App Installer file.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxappinstallerreader-getxmldom
     */
    GetXmlDom() {
        result := ComCall(3, this, "ptr*", &dom := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLDOMDocument(dom)
    }
}
