#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides a set of constants that identify types of annotations in a document, as used by the [ISpreadsheetItemProvider](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-ispreadsheetitemprovider)  Microsoft UI Automation interface.
 * @remarks
 * This enumeration is used as an input value to the [GetAnnotationTypes](../windows.ui.xaml.automation.provider/ispreadsheetitemprovider_getannotationtypes_911639376.md) method.
 * 
 * The values in AnnotationType parallel the values in the [Annotation Type Identifiers](/windows/desktop/WinAuto/uiauto-annotation-type-identifiers) constants.
 * 
 * <!--The descriptions in this topic are adapted or taken directly from http://msdn.microsoft.com/library/windows/desktop/hh448743(v=vs.85).aspx-->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.annotationtype
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class AnnotationType extends Win32Enum{

    /**
     * The annotation type is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 60000

    /**
     * A spelling error, often denoted by a red squiggly line.
     * @type {Integer (Int32)}
     */
    static SpellingError => 60001

    /**
     * A grammatical error, often denoted by a green squiggly line.
     * @type {Integer (Int32)}
     */
    static GrammarError => 60002

    /**
     * A comment. Comments can take different forms depending on the application.
     * @type {Integer (Int32)}
     */
    static Comment => 60003

    /**
     * An error in a formula. Formula errors typically include red text and exclamation marks.
     * @type {Integer (Int32)}
     */
    static FormulaError => 60004

    /**
     * A change that was made to the document.
     * @type {Integer (Int32)}
     */
    static TrackChanges => 60005

    /**
     * The header for a page in a document.
     * @type {Integer (Int32)}
     */
    static Header => 60006

    /**
     * The footer for a page in a document.
     * @type {Integer (Int32)}
     */
    static Footer => 60007

    /**
     * Highlighted content, typically denoted by a contrasting background color.
     * @type {Integer (Int32)}
     */
    static Highlighted => 60008

    /**
     * Endnote content.
     * @type {Integer (Int32)}
     */
    static Endnote => 60009

    /**
     * Footnote content.
     * @type {Integer (Int32)}
     */
    static Footnote => 60010

    /**
     * An insertion change.
     * @type {Integer (Int32)}
     */
    static InsertionChange => 60011

    /**
     * A deletion change.
     * @type {Integer (Int32)}
     */
    static DeletionChange => 60012

    /**
     * A move change.
     * @type {Integer (Int32)}
     */
    static MoveChange => 60013

    /**
     * A format change.
     * @type {Integer (Int32)}
     */
    static FormatChange => 60014

    /**
     * An unsynced change.
     * @type {Integer (Int32)}
     */
    static UnsyncedChange => 60015

    /**
     * An editing locked change.
     * @type {Integer (Int32)}
     */
    static EditingLockedChange => 60016

    /**
     * An external change.
     * @type {Integer (Int32)}
     */
    static ExternalChange => 60017

    /**
     * A conflicting change.
     * @type {Integer (Int32)}
     */
    static ConflictingChange => 60018

    /**
     * Author info.
     * @type {Integer (Int32)}
     */
    static Author => 60019

    /**
     * An advanced proofing issue.
     * @type {Integer (Int32)}
     */
    static AdvancedProofingIssue => 60020

    /**
     * A data validation error.
     * @type {Integer (Int32)}
     */
    static DataValidationError => 60021

    /**
     * A circular reference error.
     * @type {Integer (Int32)}
     */
    static CircularReferenceError => 60022
}
