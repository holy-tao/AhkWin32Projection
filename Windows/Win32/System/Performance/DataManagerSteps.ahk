#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the actions that the data manager takes when it runs.
 * @remarks
 * 
  * Specify one or more actions. The data manager applies the actions in the order in which they are defined in this enumeration.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//pla/ne-pla-datamanagersteps
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class DataManagerSteps{

    /**
     * Runs TraceRpt.exe using as input all the binary performance files (.blg) or event trace files (.etl) in the collection. You can use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatamanager-get_reportschema">IDataManager::ReportSchema</a> property to customize the report.
 * 
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatamanager-get_ruletargetfilename">IDataManager::RuleTargetFileName</a> property contains the name of the file that TraceRpt creates.
     * @type {Integer (Int32)}
     */
    static plaCreateReport => 1

    /**
     * If a report exists, apply the rules specified in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatamanager-get_rules">IDataManager::Rules</a> property to the report.
 * 
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatamanager-get_ruletargetfilename">RuleTargetFileName</a> property contains the name of the file to which the rules are applied.
     * @type {Integer (Int32)}
     */
    static plaRunRules => 2

    /**
     * Converts the XML file specified in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatamanager-get_ruletargetfilename">RuleTargetFileName</a> to HTML format. The HTML format is written to the file specified in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatamanager-get_reportfilename">IDataManager::ReportFileName</a> property.
     * @type {Integer (Int32)}
     */
    static plaCreateHtml => 4

    /**
     * Apply the folder actions specified in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatamanager-get_folderactions">IDataManager::FolderActions</a> property to all folders defined in the collection.
     * @type {Integer (Int32)}
     */
    static plaFolderActions => 8

    /**
     * If the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatamanager-get_maxfoldercount">IDataManager::MaxFolderCount</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatamanager-get_maxsize">IDataManager::MaxSize</a>, or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatamanager-get_minfreedisk">IDataManager::MinFreeDisk</a> property exceeds its limit, apply the resource policy specified in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatamanager-get_resourcepolicy">IDataManager::ResourcePolicy</a> property.
     * @type {Integer (Int32)}
     */
    static plaResourceFreeing => 16
}
