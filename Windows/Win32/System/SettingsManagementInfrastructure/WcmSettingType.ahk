#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes setting types that are returned from the ISettingsItem::GetSettingType method and defines the object model type for the calling ISettingsItem interface.
 * @remarks
 * 
 * <div class="alert"><b>Note</b>  All methods of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsitem">ISettingsItem</a> interface, other than the ones that are explicitly described for a particular type, may be called on any type of setting.</div>
 * <div> </div>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/ne-wcmconfig-wcmsettingtype
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 * @version v4.0.30319
 */
class WcmSettingType{

    /**
     * For items of this type, you can call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsitem-getdatatype">ISettingsItem::GetDataType</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsitem-getvalue">ISettingsItem::GetValue</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsitem-getvalueraw">ISettingsItem::GetValueRaw</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsitem-getrestriction">ISettingsItem::GetRestriction</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsitem-getrestrictionfacets">ISettingsItem::GetRestrictionFacets</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsitem-setvalue">ISettingsItem::SetValue</a>, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsitem-setvalueraw">ISettingsItem::SetValueRaw</a> methods.
     * @type {Integer (Int32)}
     */
    static settingTypeScalar => 1

    /**
     * Items of this type may have children. You may call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsitem-children">ISettingsItem::Children</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsitem-getchild">ISettingsItem::GetChild</a>, or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsitem-haschild">ISettingsItem::HasChild</a> methods on this setting type.
     * @type {Integer (Int32)}
     */
    static settingTypeComplex => 2

    /**
     * Items of this type may have children. You may call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsitem-children">ISettingsItem::Children</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsitem-getchild">ISettingsItem::GetChild</a>, or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsitem-haschild">ISettingsItem::HasChild</a> methods on this setting type. You can also call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsitem-createlistelement">ISettingsItem::CreateListElement</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsitem-removelistelement">ISettingsItem::RemoveListElement</a> methods  on children of items of this type.
     * @type {Integer (Int32)}
     */
    static settingTypeList => 3
}
