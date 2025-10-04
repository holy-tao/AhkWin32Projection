#Requires AutoHotkey v2.0

class BetterJUnit {

    __new(instance)
    {
        this.filename := A_ScriptDir . "\junit.xml"
        ; the file is deleted if it exists already
        if FileExist(this.filename) {
            FileDelete(this.filename)
        }

        this.out := Array()
        this.tests := {}
        this.tests.pass := 0
        this.tests.fail := 0
        this.tests.overall := 0
		
        Return this
    }
  
    __Delete() {
        file := FileOpen(this.filename, "w")
        file.write('<?xml version="1.0" encoding="UTF-8"?>`n')
        msg := '<testsuites failures="' . this.tests.fail . '" tests="' . this.tests.overall . '">'
        file.write(msg . "`n")
        msg := '`t<testsuite failures="' . this.tests.fail . '" tests="' . this.tests.overall . '" name="AHK_YUnit">'
        file.write(msg . "`n")

        Loop this.out.Length
            file.write(this.out[A_Index] . "`n")

        file.write("`t</testsuite>`n")
        file.write("</testsuites>`n")
        file.close()
    }
    
    Update(Category, TestName, Result)
    {		
        this.tests.overall := this.tests.overall + 1
        msg := '`t`t<testcase name="' . TestName . '" classname="' . Category . '"'
        if Result is Error
        {
            this.out.Push(msg . ">")
            this.tests.fail := this.tests.fail + 1

            this.out.Push(Format('`t`t`t<failure type ="failure" file="{1}" line="{2}">', this.StripPathToRelative(Result.file), Result.Line))
            this.out.Push(this.FormatErrorForReport(Result))
            this.out.Push("`t`t`t</failure>")

            this.out.Push("`t`t</testcase>")
        }
		Else 
        {
            this.out.Push(msg . "/>")
            this.tests.pass := this.tests.pass + 1
        }
    }

    FormatErrorForReport(err){
        str := Format("{1}: {2}", Type(err), err.message)
        if(err.extra != "")
            str .= Format("`n`tSpecifically: {1}", err.extra)
        str .= "`n`n" . err.stack

        return this.XmlEscape(str)
    }

    XmlEscape(str){
        str := StrReplace(str, "&", "&amp;")
        str := StrReplace(str, "<", "&lt;")
        str := StrReplace(str, ">", "&gt;")
        str := StrReplace(str, "'", "&apos;")
        str := StrReplace(str, '"', "&quot;")

        return str
    }

    /**
     * Take an absolute path to a file and strip it so that it's relative to the repo root,
     * for runner annotations
     * @param filepath 
     */
    StripPathToRelative(filepath){
        static repoName := "AhkWin32projection"
        return SubStr(filepath, InStr(filepath, repoName) + StrLen(repoName) + 1)
    }
}