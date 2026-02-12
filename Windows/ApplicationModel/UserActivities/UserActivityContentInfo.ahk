#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserActivityContentInfo.ahk
#Include .\IUserActivityContentInfoStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the content metadata of this activity in JSON format.
 * @remarks
 * For example, if your activity was reading an RSS feed, the content might include the name of the article and its author.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivitycontentinfo
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class UserActivityContentInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserActivityContentInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserActivityContentInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a **UserActivityContentInfo** from a JSON string.
     * @param {HSTRING} value The content to store in JSON format.
     * @returns {UserActivityContentInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivitycontentinfo.fromjson
     */
    static FromJson(value) {
        if (!UserActivityContentInfo.HasProp("__IUserActivityContentInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserActivities.UserActivityContentInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserActivityContentInfoStatics.IID)
            UserActivityContentInfo.__IUserActivityContentInfoStatics := IUserActivityContentInfoStatics(factoryPtr)
        }

        return UserActivityContentInfo.__IUserActivityContentInfoStatics.FromJson(value)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Provides the **UserActivityContentInfo** in the form of a JSON string.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivitycontentinfo.tojson
     */
    ToJson() {
        if (!this.HasProp("__IUserActivityContentInfo")) {
            if ((queryResult := this.QueryInterface(IUserActivityContentInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityContentInfo := IUserActivityContentInfo(outPtr)
        }

        return this.__IUserActivityContentInfo.ToJson()
    }

;@endregion Instance Methods
}
