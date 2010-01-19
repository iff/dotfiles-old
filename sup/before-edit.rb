if header["To"] =~ /psi|cscs/
    header["From"] = "Yves Ineichen <yves.ineichen@psi.ch>"
elsif header["To"] =~ /eth/
    header["From"] = "Yves Ineichen <ineichen@inf.ethz.ch>"
else
    header["From"] = "Yves Ineichen <iff@yvesineichen.com>"
end
