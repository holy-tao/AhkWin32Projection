#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStandardDataFormatsStatics.ahk
#Include .\IStandardDataFormatsStatics3.ahk
#Include .\IStandardDataFormatsStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains static properties that return string values. Each string corresponds to a known format ID. Use this class to avoid errors in using string constants to specify data formats.
 * @remarks
 * The [DataPackage](datapackage.md) class supports several format types. Whenever you need to specify a format, we recommend using the properties of the **StandardDataFormats** class, instead of string values. Doing so ensures consistency between source and target applications.
 * 
 * The [DataPackage](datapackage.md) class supports a number of legacy formats for interoperability between UWP app and desktop apps. To retrieve these formats, you pass one of the following strings to the [DataPackageView.GetDataAsync](datapackageview_getdataasync_225712847.md) method instead of a value from the **StandardDataFormats** class. <table>
 *    <tr><th>If format name is:</th><th>GetDataAsync() retrieves:</th></tr>
 *    <tr><td>"AnsiText"</td><td>String for CF_TEXT.</td></tr>
 *    <tr><td>"DeviceIndependentBitmap"</td><td>Stream for HGLOBAL corresponding to CF_DIB.</td></tr>
 *    <tr><td>"DeviceIndependentBitmapV5"</td><td>Stream for HGLOBAL corresponding to CF_DIBV5.</td></tr>
 *    <tr><td>"DataInterchangeFormat"</td><td>Stream for HGLOBAL corresponding to CF_DIF.</td></tr>
 *    <tr><td>"EnhancedMetafile"</td><td>Stream for HENHMETAFILE corresponding to CF_ENHMETAFILE.</td></tr>
 *    <tr><td>"Locale"</td><td>Stream for HGLOBAL corresponding to CF_LOCALE</td></tr>
 *    <tr><td>"OEMText"</td><td>String for CF_OEMTEXT.</td></tr>
 *    <tr><td>"PenData"</td><td>Stream for HGLOBAL corresponding to CF_PENDATA</td></tr>
 *    <tr><td>"RiffAudio"</td><td>Stream for HGLOBAL corresponding to CF_RIFF.</td></tr>
 *    <tr><td>"SymbolicLink"</td><td>Stream for HGLOBAL corresponding to CF_SYLK.</td></tr>
 *    <tr><td>"TaggedImageFileFormat"</td><td>Stream for HGLOBAL corresponding to CF_TIFF.</td></tr>
 *    <tr><td>"WaveAudio"</td><td>Stream for HGLOBAL corresponding to CF_WAVE.</td></tr>
 * </table>
 * 
 * The Windows Runtime provides limited support for metafiles. Specifically, the Windows Runtime:
 * + Supports rendering metafiles, but not creating them.
 * + Supports the CF_ENHMETAFILE format ("EnhancedMetafile"), but not CF_METAFILEPICT.
 * + Supports requesting data in "EnhancedMetafile" format, but not providing it; that is, calling `SetData("EnhancedMetafile", <data>)` won't work.
 * + Provides limited support through the clipboard API for exchanging metafiles between UWP app and desktop apps.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.standarddataformats
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class StandardDataFormats extends IInspectable {
;@region Static Properties
    /**
     * A read-only property that returns the format ID string value corresponding to the Text format.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.standarddataformats.text
     * @type {HSTRING} 
     */
    static Text {
        get => StandardDataFormats.get_Text()
    }

    /**
     * > [!NOTE]
     * > Uri may be altered or unavailable for releases after Windows 8.1. Instead, use [ApplicationLink](standarddataformats_applicationlink.md) or [WebLink](standarddataformats_weblink.md).
     * 
     * A read-only property that returns the format ID string value corresponding to the Uniform Resource Identifier (URI) format.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.standarddataformats.uri
     * @type {HSTRING} 
     */
    static Uri {
        get => StandardDataFormats.get_Uri()
    }

    /**
     * A read-only property that returns the format ID string value corresponding to the HTML format.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.standarddataformats.html
     * @type {HSTRING} 
     */
    static Html {
        get => StandardDataFormats.get_Html()
    }

    /**
     * A read-only property that returns the format ID string value corresponding to the Rich Text Format (RTF).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.standarddataformats.rtf
     * @type {HSTRING} 
     */
    static Rtf {
        get => StandardDataFormats.get_Rtf()
    }

    /**
     * A read-only property that returns the format ID string value corresponding to the Bitmap format.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.standarddataformats.bitmap
     * @type {HSTRING} 
     */
    static Bitmap {
        get => StandardDataFormats.get_Bitmap()
    }

    /**
     * A read-only property that returns the format ID string value corresponding to the storage item format (for files and folders).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.standarddataformats.storageitems
     * @type {HSTRING} 
     */
    static StorageItems {
        get => StandardDataFormats.get_StorageItems()
    }

    /**
     * A read-only property that returns the format ID string value corresponding to the [UserActivity](../windows.applicationmodel.useractivities/useractivity.md) JSON array format.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.standarddataformats.useractivityjsonarray
     * @type {HSTRING} 
     */
    static UserActivityJsonArray {
        get => StandardDataFormats.get_UserActivityJsonArray()
    }

    /**
     * A read-only property that returns the format ID string value corresponding to the web link format.
     * @remarks
     * A web link represents a Uniform Resource Identifier (URI) with a scheme of **http** or **https**. These schemes are handled by a user's default web browser.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.standarddataformats.weblink
     * @type {HSTRING} 
     */
    static WebLink {
        get => StandardDataFormats.get_WebLink()
    }

    /**
     * A read-only property that returns the format ID string value corresponding to the activation link format.
     * @remarks
     * An application link represents a Uniform Resource Identifier (URI) with a scheme that isn't **http** or **https** that can be handled by a UWP app. The referenced app must be capable of being the default handler for the Uniform Resource Identifier (URI) scheme, although it may not be set as the default handler.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.standarddataformats.applicationlink
     * @type {HSTRING} 
     */
    static ApplicationLink {
        get => StandardDataFormats.get_ApplicationLink()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Text() {
        if (!StandardDataFormats.HasProp("__IStandardDataFormatsStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.StandardDataFormats")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardDataFormatsStatics.IID)
            StandardDataFormats.__IStandardDataFormatsStatics := IStandardDataFormatsStatics(factoryPtr)
        }

        return StandardDataFormats.__IStandardDataFormatsStatics.get_Text()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Uri() {
        if (!StandardDataFormats.HasProp("__IStandardDataFormatsStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.StandardDataFormats")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardDataFormatsStatics.IID)
            StandardDataFormats.__IStandardDataFormatsStatics := IStandardDataFormatsStatics(factoryPtr)
        }

        return StandardDataFormats.__IStandardDataFormatsStatics.get_Uri()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Html() {
        if (!StandardDataFormats.HasProp("__IStandardDataFormatsStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.StandardDataFormats")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardDataFormatsStatics.IID)
            StandardDataFormats.__IStandardDataFormatsStatics := IStandardDataFormatsStatics(factoryPtr)
        }

        return StandardDataFormats.__IStandardDataFormatsStatics.get_Html()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Rtf() {
        if (!StandardDataFormats.HasProp("__IStandardDataFormatsStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.StandardDataFormats")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardDataFormatsStatics.IID)
            StandardDataFormats.__IStandardDataFormatsStatics := IStandardDataFormatsStatics(factoryPtr)
        }

        return StandardDataFormats.__IStandardDataFormatsStatics.get_Rtf()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Bitmap() {
        if (!StandardDataFormats.HasProp("__IStandardDataFormatsStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.StandardDataFormats")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardDataFormatsStatics.IID)
            StandardDataFormats.__IStandardDataFormatsStatics := IStandardDataFormatsStatics(factoryPtr)
        }

        return StandardDataFormats.__IStandardDataFormatsStatics.get_Bitmap()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_StorageItems() {
        if (!StandardDataFormats.HasProp("__IStandardDataFormatsStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.StandardDataFormats")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardDataFormatsStatics.IID)
            StandardDataFormats.__IStandardDataFormatsStatics := IStandardDataFormatsStatics(factoryPtr)
        }

        return StandardDataFormats.__IStandardDataFormatsStatics.get_StorageItems()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_UserActivityJsonArray() {
        if (!StandardDataFormats.HasProp("__IStandardDataFormatsStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.StandardDataFormats")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardDataFormatsStatics3.IID)
            StandardDataFormats.__IStandardDataFormatsStatics3 := IStandardDataFormatsStatics3(factoryPtr)
        }

        return StandardDataFormats.__IStandardDataFormatsStatics3.get_UserActivityJsonArray()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_WebLink() {
        if (!StandardDataFormats.HasProp("__IStandardDataFormatsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.StandardDataFormats")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardDataFormatsStatics2.IID)
            StandardDataFormats.__IStandardDataFormatsStatics2 := IStandardDataFormatsStatics2(factoryPtr)
        }

        return StandardDataFormats.__IStandardDataFormatsStatics2.get_WebLink()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ApplicationLink() {
        if (!StandardDataFormats.HasProp("__IStandardDataFormatsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.StandardDataFormats")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardDataFormatsStatics2.IID)
            StandardDataFormats.__IStandardDataFormatsStatics2 := IStandardDataFormatsStatics2(factoryPtr)
        }

        return StandardDataFormats.__IStandardDataFormatsStatics2.get_ApplicationLink()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
